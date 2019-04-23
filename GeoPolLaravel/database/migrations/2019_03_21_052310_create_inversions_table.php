<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInversionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inversions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre_inversionista');
            $table->string('nombre_proyecto');
            $table->double('monto');
            $table->timestamps();
        });

        /*Schema::enableForeignKeyConstraints();*/

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inversions');
    }
}
