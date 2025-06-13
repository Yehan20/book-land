<?php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\UnauthorizedException;
use Illuminate\Validation\ValidationException;
use PHPOpenSourceSaver\JWTAuth\Exceptions\TokenInvalidException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
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

        //  expection handler for valiation
        $exceptions->render(function (ValidationException $e, Request $request) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage(), 'errors' => $e->errors()], 422); // Changed to 404
        });

        //  expection handlers for Auth relation expections
        $exceptions->render(function (TokenInvalidException $e, Request $request) {
            $message = ! $request->header('Authorization') ? 'Token not provided' : 'Invalid token';

            return response()->json(['status' => 'error', 'message' => $message], 401);
        });

        $exceptions->render(function (AuthenticationException $e, Request $request) {
            $message = ! $request->header('Authorization') ? 'Token not available' : 'Unauthenticated';

            return response()->json(['status' => 'error', 'message' => $message], 401);
        });

        // Resource not found expection handler
        $exceptions->render(function (NotFoundHttpException $e, Request $request) {
            if ($e->getPrevious() instanceof ModelNotFoundException) {
                return response()->json(['status' => 'error', 'message' => $e->getMessage()], 404);
            }

            return response()->json(['status' => 'error', 'message' => 'Route Not Found'], 404);
        });

        // Access denied exception handler
        $exceptions->render(function (AccessDeniedHttpException $e, Request $request) {
            Log::error('Unhandled Exception: '.$e->getMessage(), ['exception' => $e]);

            return response()->json(
                [
                    'status' => 'error',
                    'message' => $e->getMessage(),
                ],
                403
            );
        });

        // Unathorized  expection handlar
        $exceptions->render(function (UnauthorizedException $e, Request $request) {
            Log::error('Unhandled Exception: '.$e->getMessage(), ['exception' => $e]);

            return response()->json(
                [
                    'status' => 'error',
                    'message' => $e->getMessage(),
                ],
                403
            );
        });

        // Others execption handler
        $exceptions->render(function (\Exception $e, Request $request) {
            Log::error('Unhandled Exception: '.$e->getMessage(), ['exception' => $e]);

            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
            ], 500);
        });
    })->create();
