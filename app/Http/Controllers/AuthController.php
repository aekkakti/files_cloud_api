<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{

    public function __invoke() {

    }

    public function authorization(Request $request) {
       $credentials = $request->only('email', 'password');
       $user = User::where('email', $credentials['email'])->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return response()->json(['success' => false,'code' => 401, 'message' => "Authorization failed"], 401);
        }
        else
        {
            $token = $user->createToken('AuthToken')->plainTextToken;
            return response()->json(['success' => true, 'code' => 200, 'message' => "Success", 'token' => $token], 200);
        }

    }

    public function logout(Request $request) {
        $user = $request->user();

        if ($user->tokens()) {
            $user->tokens()->delete();
            return response()->json(['code' => 204], 204);
        }
        else {
            return response()->json(['message' => 'Forbidden for you', 'code' => 403], 403);
        }
    }

}
