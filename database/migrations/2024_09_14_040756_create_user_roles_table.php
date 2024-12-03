<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Create the user_roles table
        Schema::create('user_roles', function (Blueprint $table) {
            $table->id();
            $table->string('role_name');
            $table->timestamps();  // Automatically creates 'created_at' and 'updated_at' columns
        });

        // Insert the roles into the user_roles table with timestamps
        DB::table('user_roles')->insert([
            [
                'role_name' => 'Administrator',
                'created_at' => now(),  // Manually set the created_at timestamp
                'updated_at' => now()   // Manually set the updated_at timestamp
            ],
            [
                'role_name' => 'Employee',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'role_name' => 'Student',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('user_roles');
    }
};
