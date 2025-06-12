<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Requests\BookRequest;
use App\Http\Resources\BookResource;
use App\Models\Book;
use App\Services\BookService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\UnauthorizedException;


class BookController extends Controller
{

    // Instansiate the service
    public function __construct(
        protected BookService $bookService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
      
        $params = $request->query('author');
   
        return BookResource::collection($this->bookService->all($params));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(BookRequest $request)
    {
        
        Gate::authorize('create', Book::class);

        $validated = $request->validated();

        $book = $this->bookService->create($validated, $request->file('book_image'));

        return new BookResource($book);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        //
        return new BookResource($this->bookService->find($id));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(BookRequest $request, int $id)
    {
       

        $validated = $request->validated();

        $book = $this->bookService->update($validated, $id, $request->file('book_image'));

        return new BookResource($book);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {

        $this->bookService->delete($id);

        return response()->json(204);
    }

    // Non Resource methods
    public function rentBook(int $id)
    {
        $book = Book::findOrFail($id);
        if (!$book->available) {
            throw new UnauthorizedException('Book is rented already');
        }

        $book  = $this->bookService->rentBook($book, Auth::user());

        return new BookResource($book);
    }

    public function returnBook(int $id)
    {

        $book = Book::findOrFail($id);

        Gate::authorize('returnBook', $book);

        $book  = $this->bookService->returnBook($book, Auth::user());

        return new BookResource($book);
    }

    public function getUserBooksHistory()
    {
        return  BookResource::collection($this->bookService->getUserBooksHistory());
    }

    public function getUserRentedBooks()
    {
        return  BookResource::collection($this->bookService->getUserRentedBooks());
    }
}
