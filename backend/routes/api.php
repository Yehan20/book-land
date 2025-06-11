<?php

use App\Http\Controllers\api\V1\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::prefix('v1')->group(function () {

    // Authentication Routes
    Route::controller(AuthController::class)->group(function () {
        Route::post('login', 'login');
        Route::post('register', 'register');
   
        Route::middleware('auth.jwt-cookie')->group(function () {
            Route::get('user', 'getUser');
            Route::post('logout', 'logout');
            Route::post('refresh', 'refresh');
        });
    });

    // Protected non authentication routes
    Route::middleware('auth.jwt-cookie')->group(function () {
      
    });
});
