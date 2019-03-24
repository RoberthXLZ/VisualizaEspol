<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProyectosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proyectos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->enum('tipo', ['gubernamental', 'empresarial', 'sociedad civil', 'academia', 'ONG', 'otros']);
            $table->enum('categoria', ['Vínculos con la Sociedad', 'Proyectos Integradores o Investigaciones', 'consultorías', 'formación', 'otros servicios']);
            $table->text('descripcion');
            $table->date('fecha_ini');
            $table->date('fecha_fin');
            $table->integer('total_participantes');
            $table->enum('area_conocimientos', array('tecnologias', 'ciencia de la vida', 'ciencia de la tierra', 'negocios', 'otros'));
            $table->integer('id_Inversion')->unsigned();
            $table->foreign('id_Inversion')->references('id')->on('inversions');
            $table->integer('id_Involucrado')->unsigned();
            $table->foreign('id_Involucrado')->references('id')->on('involucrados');
            $table->integer('id_Beneficiario')->unsigned();
            $table->foreign('id_Beneficiario')->references('id')->on('beneficiarios');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proyectos');
    }
}
