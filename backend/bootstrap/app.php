<?php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use PHPOpenSourceSaver\JWTAuth\Exceptions\TokenInvalidException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {

        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
            'auth.jwt-cookie' => \App\Http\Middleware\JwtVerifyMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //

        $exceptions->render(function (ValidationException $e, Request $request) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage(), 'errors' => $e->errors()], 422); // Changed to 404
        });

        $exceptions->render(function (TokenInvalidException $e, Request $request) {
            $message = !$request->header('Authorization') ? 'Token not provided' : 'Invalid token';
            return response()->json(['status' => 'error', 'message' => $message], 401);
        });

        $exceptions->render(function (AuthenticationException $e, Request $request) {
            $message = !$request->header('Authorization') ? 'Token not available' : 'Unauthenticated';
            return response()->json(['status' => 'error', 'message' => $message], 401);
        });
    })->create();
