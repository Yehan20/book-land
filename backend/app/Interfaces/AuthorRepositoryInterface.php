<?php

namespace App\Interfaces;

use App\Models\Author;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

interface AuthorRepositoryInterface
{
    //
    public function all(): LengthAwarePaginator;

    public function dropdown(): Collection; // just id & title

    public function create(array $data): Author;

    public function update(array $data, int $id): Author;

    public function delete(int $id): bool;

    public function find(int $id): Author;  // throws ModelNotFoundException if not found
    // public function getFulfilledOrders();
}
