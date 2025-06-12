<?php

namespace App\Services;

use App\Interfaces\BookRepositoryInterface;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class BookService
{

    // Initialize the instance 
    public function __construct(
        protected BookRepositoryInterface $bookRepository
    ) {}


    public function all($params): LengthAwarePaginator
    {
        return $this->bookRepository->allPaginated($params);
    }

    public function create(array $data, UploadedFile $file): Book
    {
        //  Create the book and perform the file upload
        return DB::transaction(function () use ($data, $file) {
            $book = $this->bookRepository->create($data);
            if ($file) {
                $book->addMediaFromRequest('book_image')->toMediaCollection('books');
            }
            return $book;
        });
    }

    public function find(int $id): Book
    {
        return $this->bookRepository->find($id);
    }

    public function update(array $data, int $id, UploadedFile|null $file): Book
    {

        // Update the book if new image is sent perform an image upload
        return DB::transaction(function () use ($data, $file, $id) {
            $book = $this->bookRepository->update($data, $id);
            if ($file) {
                $book->addMediaFromRequest('book_image')->toMediaCollection('books');
            }

            return $book;
        });
    }


    public function delete(int $id): bool
    {
        return  $this->bookRepository->delete($id);
    }

    public function rentBook(Book $book, User $user): Book
    {

        return DB::transaction(function () use ($book, $user) {

            // Genrate date
            $dateOfBorrow = Carbon::now()->toDateString();

            // updates the book vairalbe with updated book returned from the method
            $book = $this->bookRepository->update(['available' => false], $book->id);


            $this->bookRepository->rentBookByUser($user, $book->id, [
                'date_of_borrow' => $dateOfBorrow,
                'deadline' => Carbon::parse($dateOfBorrow)->addDays(14)->toDateString(),
                'is_returned' => false,
            ]);

            return $book;
        });
    }

    public function returnBook(Book $book, User $user): Book
    {
        return DB::transaction(function () use ($book, $user) {

            $dateOfReturn =  Carbon::now()->toDateString();
            $book = $this->bookRepository->update(['available' => true], $book->id);

            $this->bookRepository->returnBookByUser($book->id, $user->id, [
                'date_of_return' => $dateOfReturn,
                'is_returned' => true,
            ]);

            return $book;
        });
    }

    public function getUserRentedBooks(): LengthAwarePaginator
    {
        // Retrvie the user's rented books from the repository
        return $this->bookRepository->getBooksByUser(Auth::user(), 'rented');
    }

    // 
    public function getUserBooksHistory(): LengthAwarePaginator
    {
        // Retrvie the user's book activity history from the repository
        return $this->bookRepository->getBooksByUser(Auth::user());
    }
}
