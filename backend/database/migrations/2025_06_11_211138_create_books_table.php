<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('books', function (Blueprint $table) {
            $table->id();
            $table->foreignId('author_id')->constrained()->onDeleteCascade();
            $table->string('title');
            $table->string('ISBN')->unique(); // ISBN should be unique
            $table->decimal('price', 8, 2); // 8 digits in total, 2 after the decimal
            // $table->integer('stock')->min(0)->default(1); // 8 digits in total, 2 after the decimal
            $table->boolean('available')->default(true);
            $table->enum('genre',['fantasy', 'science fiction', 'mystery', 'thriller', 'romance', 'historical fiction', 'horror'])->nullable();
            $table->text('description')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
    }
};
