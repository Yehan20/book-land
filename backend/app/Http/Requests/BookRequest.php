<?php

namespace App\Http\Requests;

use App\Models\Book;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class BookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            'author_id' => ['required', 'exists:authors,id'],
            'title' => ['required', 'string'],
            'ISBN' => ['required', 'unique:books,ISBN'],
            'price' => ['required', 'numeric'],
            'available' => ['required', 'boolean'],
            'genre' => ['required', 'in:fantasy,science fiction,mystery,thriller,romance,historical fiction,horror'],
            'book_image' => ['required', 'file', 'mimes:jpg,bmp,png,jpeg', 'max:2048'],
            'description' => ['nullable', 'string', 'max:255'],
        ];

        if ($this->method() === 'PATCH') {

            $book = Book::find($this->id);

            $rules['ISBN'] = ['required', Rule::unique('books')->ignore($book->id)];
            $rules['book_image'] = ['nullable', 'file', 'mimes:jpg,bmp,png,jpeg', 'max:2048'];
        }

        return $rules;
    }
}
