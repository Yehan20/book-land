<?php

namespace App\Interfaces;

use App\Models\Book;
use App\Models\User;
use Illuminate\Pagination\LengthAwarePaginator;

interface BookRepositoryInterface
{
    public function allPaginated(?array $params): LengthAwarePaginator;

    public function create(array $data): Book;

    public function update(array $data, int $id): Book;

    public function delete(int $id): bool;

    public function find(int $id): Book;  // throws ModelNotFoundException if not found

    public function rentBookByUser(User $user, int $bookId, array $data): void;

    public function returnBookByUser(int $bookId, int $userId, array $data): void;

    public function getBooksByUser(User $user, string $condition = ''): LengthAwarePaginator;
}
