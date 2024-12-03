<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBiometricsTable extends Migration
{
    public function up()
    {
        Schema::create('biometrics', function (Blueprint $table) {
            // Adding an auto-incrementing ID
            $table->id();

            // Foreign key referencing users table with cascade delete
            $table->foreignId('user_id')
                  ->constrained('users')  // References 'id' on 'users' table
                  ->onDelete('cascade');  // Ensures that the corresponding biometrics record is deleted when a user is deleted

            $table->string('captured_image');  // Column to store captured image path
            $table->timestamps();  // Created and Updated timestamps
        });
    }

    public function down()
    {
        // Drop the table if exists
        Schema::dropIfExists('biometrics');
    }
}
