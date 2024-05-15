<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Cuenta;
use PhpParser\Node\Expr\Cast\Double;

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

    public function DependienteDelBancoDepositar(Request $request) {
        $ID_Cuenta = $request->ID_Cuenta;
        $Deposito = $request->Deposito;
        if (!is_null($ID_Cuenta) && (double)$Deposito >= 0) {
    
            // Actualizar el saldo directamente en la base de datos sumando el depósito al saldo actual
            $affected = Cuenta::where('ID_Cuenta', $ID_Cuenta)->increment('Saldo', $Deposito);
    
            if ($affected > 0) {
                // Devolver una respuesta de éxito
                return response()->json([
                    'mensaje' => "Depósito de $Deposito realizado con éxito en la cuenta $ID_Cuenta."
                ], 200);
            } else {
                // La cuenta no existe
                return response()->json([
                    'mensaje' => "La cuenta con ID $ID_Cuenta no fue encontrada."
                ], 404);
            }
        } else {
            // Los parámetros no son válidos
            return response()->json([
                'mensaje' => "Los parámetros no son válidos. Asegúrate de que el ID de cuenta no sea nulo y el depósito sea un número positivo."
            ], 500);
        }
    }

    public function DependienteDelBancoRetirar(Request $request) {
        $ID_Cuenta = $request->ID_Cuenta;
        $Retiro = $request->Retiro; 
        if (!is_null($ID_Cuenta) && (double)$Retiro >= 0) { 
    
            // Verifica si la cuenta existe
            $cuenta = Cuenta::where('ID_Cuenta', $ID_Cuenta)->first();
            echo $cuenta;
    
            if ($cuenta) {
              
                if ((Double)$cuenta->Saldo >= $Retiro) {
                   
                    $affected = Cuenta::where('ID_Cuenta', $ID_Cuenta)->decrement('saldo', $Retiro);
    
                    if ($affected > 0) {
                        // Si funciona pasa esto
                        return response()->json([
                            'mensaje' => "Retiro de $Retiro realizado con éxito en la cuenta $ID_Cuenta."
                        ], 200);
                    } else {
                        
                        return response()->json([
                            'mensaje' => "Error al realizar el retiro en la cuenta $ID_Cuenta."
                        ], 500);
                    }
                } else {
                    
                    return response()->json([
                        'mensaje' => "Saldo insuficiente en la cuenta $ID_Cuenta para realizar el retiro de $Retiro."
                    ], 400);
                }
            } else {
               
                return response()->json([
                    'mensaje' => "La cuenta con ID $ID_Cuenta no fue encontrada."
                ], 404);
            }
        } else {
           
            return response()->json([
                'mensaje' => "Los parámetros no son válidos. Asegúrate de que el ID de cuenta no sea nulo y el retiro sea un número positivo."
            ], 400);
        }
    }
    
    
    
    
    
    

}    
