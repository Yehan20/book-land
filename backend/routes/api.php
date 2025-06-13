<?php

use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\AuthorController;
use App\Http\Controllers\api\BookController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// public routes
Route::get('books', [BookController::class, 'index']);
Route::get('books/{id}', [BookController::class, 'show'])->where('id', '[0-9]+');
Route::get('authors/dropdown', [AuthorController::class, 'getDropdown']);

// Protected  routes
Route::middleware('auth.jwt-cookie')->group(function () {

    Route::apiResource('authors', AuthorController::class)->middleware('role:admin');

    Route::post('books', [BookController::class, 'store']);
    Route::prefix('books')->group(function () {

        Route::middleware('role:admin')->group(function () {

            Route::patch('{id}', [BookController::class, 'update']);
            Route::delete('{id}', [BookController::class, 'destroy']);
        });

        Route::middleware('role:customer')->group(function () {

            Route::post('{id}/rent', [BookController::class, 'rentBook']);
            Route::patch('{id}/return', [BookController::class, 'returnBook']);
            Route::get('rented', [BookController::class, 'getUserRentedBooks']);
            Route::get('history', [BookController::class, 'getUserBooksHistory']);
        });
    });
});
