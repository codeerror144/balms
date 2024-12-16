<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    // Automatically handle 'email_verified_at' field as a date
    protected $dates = ['email_verified_at'];

    // Ensure these fields are fillable for mass assignment
    protected $fillable = [
        'name', 'email', 'password', 'role_id', 'type', 'email_verified_at', 'remember_token',
    ];

    // Hide sensitive fields from being exposed in arrays or JSON
    protected $hidden = [
        'password', 'remember_token',
    ];

    // Type cast attributes, e.g., email_verified_at should be treated as a timestamp
    protected $casts = [
        'email_verified_at' => 'datetime', // Automatically cast to Carbon instance
    ];

    // Define the relationship with UserRole
    public function role()
    {
        return $this->belongsTo(UserRole::class, 'role_id');
    }

    // You may also add an accessor to get the role name
    public function getRoleNameAttribute()
    {
        return $this->role ? $this->role->role_name : 'No Role';
    }

    public function biometric()
    {
        return $this->hasOne(Biometric::class);
    }
    public function notifications()
    {
        return $this->hasMany(Notification::class);
    }

    public function biometrics()
{
    return $this->hasOne(Biometric::class, 'user_id');
}

}
