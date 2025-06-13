<?php

namespace App\Repositories;

use App\Interfaces\AuthorRepositoryInterface;
use App\Models\Author;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class AuthorRepository implements AuthorRepositoryInterface
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    // Get paginated authors list
    public function all(): LengthAwarePaginator
    {
        return Author::with('books.media')->paginate(10);
    }

    // Get author list for drop down
    public function dropdown(): Collection
    {
        return Author::all(['name', 'id']);
    }

    // Create author
    public function create(array $data): Author
    {
        return Author::create($data);
    }

    // Update author
    public function update(array $data, int $id): Author
    {
        $author = Author::findOrFail($id);

        return $author->update($data);
    }

    // Delete author
    public function delete(int $id): bool
    {
        $author = Author::findOrFail($id);

        return $author->delete();
    }

    // get single author
    public function find(int $id): Author
    {
        return Author::findOrFail($id);
    }
}
