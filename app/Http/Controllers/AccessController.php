<?php

namespace App\Http\Controllers;

use App\Models\Access;
use App\Models\File;
use App\Models\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AccessController extends Controller
{

    public function addAccesses(Request $request, $file_id) {

        $file = File::where('file_id', $file_id)->first();

        if (!$file) {
            return response()->json(['message' => 'Not found', 'code' => 404], 404);
        }

        $user = Auth::user();
        if (!$user->accesses()->where('file_id', $file_id)->exists() || $user->accesses()->where('file_id', $file_id)->value('type') !== 'author') {
            return response()->json(['message' => 'Forbidden for you'], 403);
        }

        $addedUser = User::where('email', $request->input('email'))->first();

        Access::create([
            'user_id' => $addedUser->id,
            'full_name' => $addedUser->first_name . ' ' . $addedUser->last_name,
            'type' => 'co-author',
            'email' => $addedUser->email,
            'file_id' => $file_id,
        ]);

        return $this->getListAccesses($file_id);

    }

    public function deleteAccesses(Request $request, $file_id) {
        $file = File::where('file_id', $file_id)->first();

        if (!$file) {
            return response()->json(['message' => 'Not found', 'code' => 404], 404);
        }

        $user = Auth::user();
        if (!$user->accesses()->where('file_id', $file_id)->exists() || $user->accesses()->where('file_id', $file_id)->value('type') !== 'author') {
            return response()->json(['message' => 'Forbidden for you'], 403);
        }

        $email = $request->input('email');

        $deletedUser = User::where('email', $email)->first();

        if (!$deletedUser) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $access = Access::where('file_id', $file_id)
            ->where('user_id', $deletedUser->id)
            ->first();

        if (!$access) {
            return response()->json([ "message" => "Not found", "code" => 404], 404);
        }

        $access->delete();

        return $this->getListAccesses($file_id);
    }

    public function getListAccesses($file_id)
    {
        $accessList = Access::where('file_id', $file_id)->get();

        $usersWithAccess = [];
        foreach ($accessList as $access) {
            $userWithAccess = User::find($access->user_id);
            if ($userWithAccess) {
                $usersWithAccess[] = [
                    'full_name' => $access->full_name,
                    'email' => $userWithAccess->email,
                    'type' => $access->type,
                    'code' => 200
                ];
            }
        }

        return response()->json($usersWithAccess, 200);
    }

}
