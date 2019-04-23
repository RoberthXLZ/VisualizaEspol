<?php

namespace App\Http\Controllers;

use App\inversion;
use Illuminate\Http\Request;
use DB;

class InversionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   /* function test_queries(Inversion $inversion){
         //$inversion new Inversion();
         $inversion->monto= request('monto');
         $inversion->monto= DB::table('inversions')->sum('inversions.monto');
        //Guardamos el cambio en nuestro modelo
        echo "<pre>";
        print_r($inversion->monto);
      
    }*/

    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Inversion $inversion)
    {
        //Instanciamos la clase Inversions


        //Declaramos el nombre con el nombre enviado en el request
        //$acum= 0;
        $nombre_inversionista = request('nombre_inversionista');
        $nombre_proyecto = request('nombre_proyecto');
        $monto = request('monto');

        $found= Inversion::where('nombre_inversionista', $nombre_inversionista)/*->where('nombre_proyecto', $nombre_proyecto)*/->count();

        if($found == 0){
            $inversion= new Inversion();

             $inversion->nombre_inversionista= request('nombre_inversionista');
             $inversion->nombre_proyecto = request('nombre_proyecto');
             $inversion->monto= request('monto');
             $inversion->save();
             //$monto= $monto + 1;
             
             return redirect()->back();
        } 
           
        
             


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\inversion  $inversion
     * @return \Illuminate\Http\Response
     */
    public function show(inversion $inversion)
    {
        //Solicitamos al modelo la Inversion con el id solicitado por GET

        return inversion::where('id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\inversion  $inversion
     * @return \Illuminate\Http\Response
     */
    public function edit(inversion $inversion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\inversion  $inversion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, inversion $inversion)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\inversion  $inversion
     * @return \Illuminate\Http\Response
     */
    public function destroy(inversion $inversion)
    {
        //
    }
}
