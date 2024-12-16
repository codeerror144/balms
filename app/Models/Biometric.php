<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Biometric extends Model
{
    use HasFactory;

    protected $table = 'biometrics';

 
    protected $fillable = [
        'user_id',
        'name', 
        'captured_image',
        'rfid_data',
    ];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }


}
