<?php

namespace App\Providers;

use App\Interfaces\AuthorRepositoryInterface;
use App\Interfaces\BookRepositoryInterface;
use App\Repositories\AuthorRepository;
use App\Repositories\BookRepository;
use App\Services\AuthorService;
use App\Services\BookService;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Register the  Repository interface  and Repository classes in the Service container
        $this->app->bind(BookRepositoryInterface::class, BookRepository::class);
        $this->app->bind(AuthorRepositoryInterface::class, AuthorRepository::class);

        $this->app->bind(BookService::class, function ($app) {
            return new BookService($app->make(BookRepositoryInterface::class));
        });
        $this->app->bind(AuthorService::class, function ($app) {
            return new AuthorService($app->make(AuthorRepositoryInterface::class));
        });

        //Register telescope
        if ($this->app->environment('local') && class_exists(\Laravel\Telescope\TelescopeServiceProvider::class)) {
            $this->app->register(\Laravel\Telescope\TelescopeServiceProvider::class);
            $this->app->register(TelescopeServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
