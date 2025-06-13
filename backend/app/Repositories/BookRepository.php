<?php

namespace App\Repositories;

use App\Interfaces\BookRepositoryInterface;
use App\Models\Book;
use App\Models\User;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class BookRepository implements BookRepositoryInterface
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    // Retrive all books with paginatpr
    public function allPaginated(?array $params): LengthAwarePaginator
    {
        $books = Book::query();

        $books->with('author', 'media');
      
        // Filer based on the query params

        if (isset($params['author'])) {

            $books->withWhereHas('author', function ($query) use ($params) {
                $query->where('name', $params['author']);
            });
        }

        if (isset($params['available'])) {

            $books->where('available', filter_var($params['available'], FILTER_VALIDATE_BOOLEAN));
        }

        return $books->paginate(10)->withQueryString();
    }

    // Create a Book
    public function create(array $data): Book
    {
        return Book::create($data);
    }

    // Update a book
    public function update(array $data, int $id): Book
    {
        $book = Book::findOrFail($id);

        $book->update($data);

        return $book;
    }

    // Delete a book
    public function delete(int $id): bool
    {
        $book = Book::findOrFail($id);

        return $book->delete();
    }

    //  Find a single book
    public function find(int $id): Book
    {
        return Book::findOrFail($id)->load('author','media');
    }

    //  Rend a book
    public function rentBookByUser(User $user, int $bookId, array $data): void
    {
        $user->books()->attach($bookId, $data);
    }

    // Return a rented book
    public function returnBookByUser(int $bookId, int $userId, array $data): void
    {
        DB::table('book_user')->where('user_id', $userId)->where('book_id', $bookId)->where('is_returned', 0)->update($data);
    }

    // Get Books based on users conditons
    public function getBooksByUser(User $user, string $condition = ''): LengthAwarePaginator
    {

        $bookQuery = $user->books()->withPivot([
            'is_returned',
            'date_of_borrow',
            'date_of_return',
            'deadline',
            'is_returned'
        ]);
        if ($condition === 'rented') {

            $bookQuery->wherePivot('is_returned', 0);
        }

        return $bookQuery->with(['author', 'media'])->paginate(10);
    }
}
