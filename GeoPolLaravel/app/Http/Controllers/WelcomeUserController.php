<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WelcomeUserController extends Controller
{
    //

    public function index($name, $nickname= null)
    {
    	
		$name= ucfirst("$name");
		$nickname= ucfirst("$nickname");

	   if($nickname)
	   {
	   		return "Bienvenido {$name} {$nickname}";
	   }else 
	   		{
	   			return "Bienvenido {$name}";
	   	}
    }

     
}
