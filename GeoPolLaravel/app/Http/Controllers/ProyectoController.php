<?php

namespace App\Http\Controllers;

use App\Proyecto;
use App\involucrado;
use App\beneficiario;
use App\inversion;
use Illuminate\Http\Request;

use DB;

class ProyectoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $ben = DB::table('proyectos')
        ->join('beneficiarios', 'beneficiarios.id','proyectos.id_Beneficiario')
        //->join('inversions', 'inversions.id','proyectos.id_Inversion')
        //->join('involucrados', 'involucrados.id','proyectos.id_Involucrado')
        ->select()
        ->get();
        
        $inv = DB::table('proyectos')
        //->join('beneficiarios', 'beneficiarios.id','proyectos.id_Beneficiario')
        ->join('inversions', 'inversions.id','proyectos.id_Inversion')
        //->join('involucrados', 'involucrados.id','proyectos.id_Involucrado')
        ->select()
        ->get();
        $pro = Proyecto::all();
        $involu = DB::table('proyectos')
        //->join('beneficiarios', 'beneficiarios.id','proyectos.id_Beneficiario')
        //->join('inversions', 'inversions.id','proyectos.id_Inversion')
        ->join('involucrados', 'involucrados.id','proyectos.id_Involucrado')
        ->select()
        ->get();
                //dd($p);
        //$p = Proyecto::all();
        //$b = $p->beneficiario;
        //return Response::json();

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
    public function store(Proyecto $proyecto)
    {
        //

        $nombre= request('nombre');
        $tipo= request('tipo');
        $categoria= request('categoria');
        $descripcion= request('descripcion');
        $fecha_ini= request('fecha_ini');
        $fecha_fin= request('fecha_fin');
        $total_participantes= request('total_participantes');
        $area_conocimientos= request('area_conocimientos');
        $id_Inversion= request('id_Inversion');
        $id_Involucrado= request('id_Involucrado');
        $id_Beneficiario= request('id_Beneficiario');

        $found= Proyecto::where('nombre', $nombre)->count();

        if($found==0){
            $proyecto= new Proyecto();
            $proyecto->nombre= request('nombre');
            $proyecto->tipo= request('tipo');
            $proyecto->categoria= request('categoria');
            $proyecto->descripcion= request('descripcion');
            $proyecto->fecha_ini= request('fecha_ini');
            $proyecto->fecha_fin= request('fecha_fin');
            $proyecto->total_participantes= request('total_participantes');
            $proyecto->area_conocimientos= request('area_conocimientos');
            $proyecto->id_Inversion= request('id_Inversion');
            $proyecto->id_Involucrado= request('id_Involucrado');
            $proyecto->id_Beneficiario= request('id_Beneficiario');
            $proyecto->save();
            return redirect()->back();
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function show(Proyecto $proyecto)
    {
        //
         return proyecto::where('id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    /*public function edit(Proyecto $proyecto)
    {
        //
    }*/

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Proyecto $proyecto)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Proyecto  $proyecto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Proyecto $proyecto)
    {
        //
    }
}
