<?php

namespace App\Services;

use App\Interfaces\AuthorRepositoryInterface;
use App\Models\Author;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class AuthorService
{

    // Initialize the repoisiotr
    public function __construct(
        protected AuthorRepositoryInterface $authorRepository
    ) {}

    public function create(array $data): Author
    {
        return $this->authorRepository->create($data);
    }

    public function update(array $data, int $id): Author
    {
        return $this->authorRepository->update($data, $id);
    }

    public function delete(int $id): bool
    {
        return  $this->authorRepository->delete($id);
    }

    public function all(): LengthAwarePaginator
    {
        return $this->authorRepository->all();
    }

    public function dropdown(): Collection
    {
        return $this->authorRepository->dropdown();
    }


    public function find(int $id): Author
    {
        return $this->authorRepository->find($id);
    }
}
