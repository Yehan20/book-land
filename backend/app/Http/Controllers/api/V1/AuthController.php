<?php

namespace App\Http\Controllers\api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use PHPOpenSourceSaver\JWTAuth\Exceptions\JWTException;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
use Spatie\Permission\Models\Role;

class AuthController extends Controller
{

    // Registration Method
    public function register(RegisterRequest $request)
    {
        $validated = $request->validated();

        //  Create a user assignment the role and login the user a
        $user = DB::transaction(function () use ($validated) {

            $user = User::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'password' => Hash::make($validated['password']),
            ]);
            $roleName = Role::where('name', 'customer')->first();
            $user->assignRole($roleName);

            return $user;
        });

        $token = Auth::login($user);

        //  Generate cookie and return with response
        $cookie = $cookie = $this->getCookie($token);

        return response()->json([
            'user' => $user->load('roles'),
            'authorisation' => [
                'type' => 'bearer',
            ]
        ])->withCookie($cookie);
    }


    // Login method
    public function login(LoginRequest $request)
    {

        // Get the credintials
        $credentials = $request->only('email', 'password');

        $token = Auth::attempt($credentials);

        if (!$token) {
            return response()->json([
                'status' => 'Error',
                'message' => 'Unauthorized',
            ], 401);
        }

        // Login success and user is authorized return the user with a cookie
        $cookie = $this->getCookie($token);

        $user = Auth::user();
        return response()->json([
            'data' => $user->load('roles'),
            'authorisation' => [
                'type' => 'bearer',
            ]
        ])->withCookie($cookie);
    }

    // Logout method
    public function logout(Request $request)
    {
        $token = $request->cookie('jwt_token');

        try {
            JWTAuth::setToken($token)->invalidate();
            return response()->json([
                'status' => 'success',
                'message' => 'Successfully logged out',
            ]);
        } catch (JWTException $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Token could not be parsed or is invalid',
            ], 401);
        }
    }

    //  Refresh token
    public function refresh()
    {
        $newToken = Auth::refresh();

        return response()->json([

            'data' => Auth::user(),
            'authorisation' => [
                'token' => $newToken,
                'type' => 'bearer',
            ]
        ]);
    }

    // Get logged user
    public function getUser()
    {

        return response()->json([
            'status' => 'success',
            'data' => Auth::user()->load('roles')
        ]);
    }

    // Creates a cookie 
    private function getCookie($token) {
         return   cookie('jwt_token', $token, 120, '/', 'localhost', false, true, false, 'lax');

    }
}
