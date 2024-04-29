<?php

namespace App\Http\Controllers;


use App\Models\Access;
use App\Models\File;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Validator;

class FileController extends Controller
{
    public function loadFiles(Request $request) {
        $arrayFiles = [];

        foreach($request->file('files') as $file) {
            $fileName = $file->getClientOriginalName();
            $existingFile = File::where('name', $fileName)->first();

            if ($existingFile) {
                $fileName = $this->generateUniqueFileName($fileName);
            }

            $validator = Validator::make(['file' => $file], [
                'file' => 'mimes:doc,pdf,docx,zip,jpeg,jpg,png|max:2048'
            ]);

            if ($validator->fails()) {
                $arrayFiles[] = [
                    'success' => false,
                    'message' => $validator->errors()->all(),
                    'name' => $fileName,
                ];
            }
            else {
                $file_id = Str::random(10);
                $newFile = File::create([
                    'name' => $fileName,
                    'url' => "http://127.0.0.1:8000/api-file/files/{$file_id}",
                    'file_id' => $file_id
                ]);

                $file->storeAs('uploads', $fileName);

                Access::create([
                    'user_id' => $request->user()->id,
                    'file_id' => $newFile->id,
                ]);

                $arrayFiles[] = [
                    'success' => true,
                    'code' => 200,
                    'message' => 'Success',
                    'name' => $newFile->name,
                    'url' => $newFile->url,
                    'file_id' => $newFile->file_id
                ];
            }
        }

        return response()->json($arrayFiles, 200);
    }

    private function generateUniqueFileName($fileName) {
        $fileNameWithoutExtension = pathinfo($fileName, PATHINFO_FILENAME);
        $extension = pathinfo($fileName, PATHINFO_EXTENSION);
        $i = 1;

        while (File::where('name', $fileName)->exists()) {
            $fileName = $fileNameWithoutExtension . " ($i)." . $extension;
            $i++;
        }

        return $fileName;
    }
    

    public function editFile(Request $request, $file_id) {
        $file = File::where('file_id', $file_id)->first();

        if (!$file) {
            return response()->json(['message' => 'Not found', 'code' => 404], 404);
        }

        $user = Auth::user();
        if (!$user->accesses()->where('file_id', $file_id)->exists()) {
            return response()->json(['message' => 'Forbidden for you'], 403);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:files,name,' . $file_id
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->all()], 422);
        }
        else {
            $extension = pathinfo($file->name, PATHINFO_EXTENSION);

            $newName = $request->name . '.' . $extension;

            $file->update([
                'name' => $newName
            ]);
            return response()->json(['success' => true, 'code' => 200, 'message' => 'Renamed'], 200);
        }
    }

    public function deleteFile($file_id) {
        $user = Auth::user();
        if (!$user->accesses()->where('file_id', $file_id)->exists()) {
            return response()->json(['message' => 'Forbidden for you'], 403);
        }

        $file = File::where('file_id', $file_id)->first();

        if (!$file) {
            return response()->json(['message' => 'Not found', 'code' => 404], 404);
        }

        Storage::delete("uploads/{$file->name}");
        $file->delete();
        return response()->json(['success' => true, 'code' => 200, 'message' => 'File deleted'], 200);
    }

    public function downloadFile($file_id) {

        $user = Auth::user();
        if (!$user->accesses()->where('file_id', $file_id)->exists()) {
            return response()->json(['message' => 'Forbidden for you'], 403);
        }

        $file = File::where('file_id', $file_id)->first();

        if (!$file) {
            return response()->json(['success' => false, 'message' => 'File not found'], 404);
        }

        $filePath = storage_path("app/uploads/{$file->name}");

        if (!file_exists($filePath)) {
            return response()->json(['success' => false, 'message' => 'File not found'], 404);
        }

        return response()->file($filePath);
    }

}
