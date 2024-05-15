<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Persona;

class PersonaController extends Controller
{
    public function index(){
        $listaPersonas = Persona::all();
        return response()->json($listaPersonas);
    }
    
}
