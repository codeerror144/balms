<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::table('logs', function (Blueprint $table) {
        $table->string('log_type')->default('entry'); // or 'exit' based on your use case
    });
}

public function down()
{
    Schema::table('logs', function (Blueprint $table) {
        $table->dropColumn('log_type');
    });
}
};
