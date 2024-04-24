<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class AuthController extends Controller
{

    public function __invoke() {

    }

    public function authorization(Request $request) {
       $credentials = $request->only('email', 'password');
       $user = User::where('email', $credentials['email'])->first();

        if (!$user || $user->password !== $credentials['password']) {
            return response()->json(['success' => false,'code' => 401, 'message' => "Authorization failed"]);
        }
        else
        {
            $token = $user->createToken('AuthToken')->plainTextToken;
            return response()->json(['success' => true, 'code' => 200, 'message' => "Success", 'token' => $token]);
        }

    }

    public function logout(Request $request) {
        $user = $request->user();
        $user->tokens()->delete();
        return response()->json(['code' => 204]);
    }

}
