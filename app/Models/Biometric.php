<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Biometric extends Model
{
    use HasFactory;

    // Specify the table name if it does not follow Laravel's naming convention
    protected $table = 'biometrics';

    // Allow mass assignment for these fields
    protected $fillable = [
        'user_id',
        'name', // Ensure this is included
        'captured_image',
        'rfid_data',
    ];



    // Optional: If yozur table has created_at and updated_at timestamps, uncomment the following line
    // public $timestamps = true;

    // Define relationship to User model
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }


}
