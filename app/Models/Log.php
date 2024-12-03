<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    // Specify the fillable fields to prevent mass assignment issues
    protected $fillable = [
        'user_id',
        'method',
        'room',
        'log_time',
        'log_type',



    ];

    // Define relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
