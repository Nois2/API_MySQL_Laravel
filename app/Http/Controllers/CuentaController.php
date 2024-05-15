<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Cuenta;

class CuentaController extends Controller
{
    public function index(){
        #SELECT * FROM ALL
        $listaCuentas = Cuenta::all();
        return response()->json($listaCuentas);

    }
}
