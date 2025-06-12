<?php

namespace Database\Seeders;

use App\Models\Book;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BookSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $books = [
            ['title' => 'Harry Potter and the Sorcerer\'s Stone', 'genre' => 'fantasy'],
            ['title' => 'Narnia: The Silver Chair', 'genre' => 'fantasy'],
            ['title' => 'Goosebumps: Night of the Living Dummy', 'genre' => 'horror'],
            ['title' => 'The Famous Five: Five on a Treasure Island', 'genre' => 'mystery'],
            ['title' => 'The Secret Seven: Secret Seven Adventure', 'genre' => 'mystery'],
            ['title' => 'Sherlock Holmes: A Study in Scarlet', 'genre' => 'thriller'],
            ['title' => 'Oliver Twist', 'genre' => 'historical fiction'],
            ['title' => 'Goosebumps: Welcome to Dead House', 'genre' => 'horror'],
            ['title' => 'The Famous Five: Five Go Adventuring Again', 'genre' => 'mystery'],
            ['title' => 'Sherlock Holmes: The Hound of the Baskervilles', 'genre' => 'thriller'],
        ];

          Book::factory()->create([
                'title' => $books[0]['title'],
                'genre' => $books[0]['genre']
            ]);
        // foreach ($books as $book) {
          
        // }
    }
}
