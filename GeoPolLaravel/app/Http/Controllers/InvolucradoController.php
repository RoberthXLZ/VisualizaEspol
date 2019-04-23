<?php

namespace App\Http\Controllers;

use App\involucrado;
use Illuminate\Http\Request;

class InvolucradoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
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
    public function store(Involucrado $involucrado)
    {
        //
        $nombre= request('nombre');
        $apellido= request('apellido');
        $cedula= request('cedula');

        $found= Involucrado::where('nombre', $nombre)->count();

        if($found == 0){
            $involucrado= new Involucrado();
            $involucrado->nombre= request('nombre');
            $involucrado->apellido= request('apellido');
            $involucrado->cedula= request('cedula');

            $involucrado-> save();
            return redirect()->back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\involucrado  $involucrado
     * @return \Illuminate\Http\Response
     */
    public function show(involucrado $involucrado)
    {
        //
        return involucrado::where('id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\involucrado  $involucrado
     * @return \Illuminate\Http\Response
     */
    /*public function edit(involucrado $involucrado)
    {
        //
    }*/

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\involucrado  $involucrado
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, involucrado $involucrado)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\involucrado  $involucrado
     * @return \Illuminate\Http\Response
     */
    public function destroy(involucrado $involucrado)
    {
        //
    }
}
