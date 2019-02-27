<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index() 

    {
         if (request()->has('empty')){
            $users = [];
         } else {
            $users = [
                'Joel', 'Ellie','Tess', 'Tommy', 'Bill',
                
            ];
         }

    	$title= 'Listado de usuarios';

        return view('users', [
            'users' => $users,
            'title' => $title
            ]);
    }

    public function show($id)
    {
    	return "Mostrar detalles del usuario: {$id}";
    }

     public function create()
    {
    	 return "Mostrar nuevo usuario";
    }

}

