<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class inversion extends Model
{
    //
    protected $fillable= ['nombre_inversionista', 'nombre_proyecto','monto'];
    
}
