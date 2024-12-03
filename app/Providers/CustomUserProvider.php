<?php

namespace App\Providers;

use Illuminate\Contracts\Auth\UserProvider;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\DatabaseManager;

class CustomUserProvider implements UserProvider
{
    protected $connection;

    public function __construct(DatabaseManager $connection, $model)
    {
        $this->connection = $connection;
        $this->model = $model;
    }

    public function retrieveById($id)
    {
        return $this->model::find($id);
    }

    public function retrieveByToken($token)
    {
        // Implement token retrieval logic if needed
    }

    public function updateRememberToken(Authenticatable $user, $token)
    {
        // Implement token update logic if needed
    }

    public function retrieveByCredentials(array $credentials)
    {
        if (isset($credentials['email'])) {
            // Determine if the user is admin or not, then query appropriate table
            if ($this->isAdmin($credentials['email'])) {
                return $this->connection->table('users')->where('email', $credentials['email'])->first();
            } else {
                return $this->connection->table('user_lists')->where('email', $credentials['email'])->first();
            }
        }
    }

    protected function isAdmin($email)
    {
        // Implement logic to check if the email belongs to an admin
    }

    public function validateCredentials(Authenticatable $user, array $credentials)
    {
        return Hash::check($credentials['password'], $user->password);
    }
}
