<?php

namespace App\Http\Controllers;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

    public function registration(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'unique:users,email'],
            'password' => ['required'],
            'first_name' => ['required'],
            'last_name' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'code' => 422, 'message' => $validator->errors()], 422);
        }



        $user = User::create([
            'email' => $request->email,
            'password' => $request->password,
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'token' => $request->token
        ]);
        $token = $user->createToken('AuthToken')->plainTextToken;
        return response()->json(['success' => true, 'code' => 201, 'message' => 'Success', 'token' => $token], 201);
    }

}
