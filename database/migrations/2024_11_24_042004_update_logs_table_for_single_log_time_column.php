<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::table('logs', function (Blueprint $table) {
        $table->dropColumn(['login_time', 'logout_time']); // Remove old columns
        $table->dateTime('log_time')->nullable();          // Add the new column
    });
}

public function down()
{
    Schema::table('logs', function (Blueprint $table) {
        $table->dateTime('login_time')->nullable();
        $table->dateTime('logout_time')->nullable();
        $table->dropColumn('log_time');
    });
}

};
