<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class beneficiario extends Model
{
    //
    protected $fillable = ['nombre','correo','celular','direccion'];
}
