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

    
    public function ObtenerCuentasPorDUIs($DUI_Persona){

    $DUI = $DUI_Persona;

    $listaCuentas = Cuenta::where('DUI_Persona', $DUI)->get(['ID_Cuenta', 'Saldo']);

    if ($listaCuentas->isEmpty()) {
        return response()->json([
            'mensaje' => 'Este número de DUI no posee cuentas'
        ], 404); 
    }

    return response()->json($listaCuentas);
}

}    
