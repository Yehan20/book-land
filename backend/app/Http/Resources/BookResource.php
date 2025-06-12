<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class BookResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $user = Auth::user();
        return [
            'id' => $this->id,
            'title' => $this->title,
            'author_id' => $this->author_id,
            'ISBN' => $this->author_id,
            'price' => $this->price,
            'available' => $this->available,
            'genre' => $this->genre,
            'image_url' => $this->whenLoaded('media', $this->getFirstMediaUrl('books')),
            'description' => $this->description,
            'author' => new AuthorResource($this->whenLoaded('author')),

            // Show this for the admin only
            $this->mergeWhen(Auth::check() && $user->isAdmin(), [
                'updated_at' => Carbon::parse($this->updated_at)->toDateTimeString(),
                'created_at' => Carbon::parse($this->created_at)->toDateTimeString(),
                'deleted_at' => Carbon::parse($this->deleted_at)->toDateTimeString(),
            ])

        ];
    }
}
