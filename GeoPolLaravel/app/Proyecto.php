<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Proyecto extends Model
{
    //
    protected $fillable= ['nombre', 'tipo', 'categoria', 'descripcion', 'fecha_ini', 'fecha_fin', 'total_participantes', 'area_conocimientos', 'id_Inversion', 'id_Involucrado', 'id_Beneficiario', 'id_Involucrado', 'id_Beneficiario', 'id_Inversion'];
}
