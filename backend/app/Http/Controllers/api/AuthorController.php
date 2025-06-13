<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AuthorDropdownResource;
use App\Http\Resources\AuthorResource;
use App\Models\Author;
use App\Services\AuthorService;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    // Injected the Service
    public function __construct(
        protected AuthorService $authorService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return AuthorResource::collection($this->authorService->all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Author $author)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Author $author)
    {
        //

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Author $author)
    {
        //

    }

    public function getDropdown()
    {
        return AuthorDropdownResource::collection($this->authorService->dropdown());
    }
}
