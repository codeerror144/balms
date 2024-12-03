<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('biometrics', function (Blueprint $table) {
        $table->string('rfid_data')->nullable()->change();
    });
}

public function down()
{
    Schema::table('biometrics', function (Blueprint $table) {
        $table->string('rfid_data')->nullable(false)->change();
    });
}

};
