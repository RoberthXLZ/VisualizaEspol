<?php

namespace App\Http\Controllers;

use App\beneficiario;
use Illuminate\Http\Request;

class BeneficiarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $ben = beneficiario::all();
        return $ben;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    /*public function create()
    {
        //
    }*/

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Beneficiario $beneficiario)
    {
        //

        //$beneficiario= new beneficiario;
         $nombre = request('nombre');
         $correo = request('correo');
         $celular = request('celular');
         $direccion = request('direccion');

         $found = Beneficiario::where('nombre', $nombre)->count();

        if($found == 0){
             // record not exist , save the record
              $beneficiario = new Beneficiario(); 
             $beneficiario->nombre = request('nombre');
             $beneficiario->correo = request('correo');
             $beneficiario->celular = request('celular');
             $beneficiario->direccion = request('direccion');
             $beneficiario->save();
             return redirect()->back();
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\beneficiario  $beneficiario
     * @return \Illuminate\Http\Response
     */
    public function show(beneficiario $beneficiario)
    {
       
        return beneficiario::where('id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\beneficiario  $beneficiario
     * @return \Illuminate\Http\Response
     */
    /*public function edit(beneficiario $beneficiario)
    {
        //
    }*/

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\beneficiario  $beneficiario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, beneficiario $beneficiario)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\beneficiario  $beneficiario
     * @return \Illuminate\Http\Response
     */
    public function destroy(beneficiario $beneficiario)
    {
        //
    }
}
