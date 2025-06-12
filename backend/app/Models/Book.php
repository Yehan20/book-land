<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Book extends Model implements HasMedia
{
  
    use HasFactory, SoftDeletes, InteractsWithMedia;

    protected $fillable = [
        'author_id',
        'title',
        'ISBN',
        'price',
        'available',
        'genre',
        'description',
    ];

    protected $casts = [
        'available'=>'boolean'
    ];

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('books')->singleFile();
    }

    public function author(): BelongsTo
    {
        return $this->belongsTo(Author::class);
    }

    public function users():BelongsToMany {
         return $this->belongsToMany(User::class)->withPivot('is_returned', 'date_of_borrow','date_of_return');
    }
}
