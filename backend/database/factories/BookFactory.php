<?php

namespace Database\Factories;

use App\Models\Author;
use App\Models\Book;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Book>
 */
class BookFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // retrive author id list
        $authors = Author::pluck('id');

        return [
            'author_id' => $authors->random(), // add author id
            'title' => 'Book'.fake()->word(),
            'ISBN' => fake()->unique()->isbn13(),
            'price' => fake()->randomFloat(2, 5, 100),
            'available' => true,
            'description' => fake()->unique()->paragraph(3),
        ];
    }

    // Image upload after navigation
    //  Assign role after creation
    public function configure(): static
    {
        return $this->afterMaking(function (Book $book) {})->afterCreating(function (Book $book) {
            // $path =
            $book->addMedia(storage_path('placeholder/book.jpg'))
                ->preservingOriginal()
                ->toMediaCollection('books');
        });
    }
}
