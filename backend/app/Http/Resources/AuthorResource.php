<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class AuthorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'books' => BookResource::collection($this->whenLoaded('books')),

            // Show this for the admin only
            $this->mergeWhen(Auth::check() && Auth::user()->isAdmin(), [
                'updated_at' => Carbon::parse($this->updated_at)->toDateTimeString(),
                'created_at' => Carbon::parse($this->created_at)->toDateTimeString(),
                'deleted_at' => Carbon::parse($this->deleted_at)->toDateTimeString(),
            ]),

        ];
    }
}
