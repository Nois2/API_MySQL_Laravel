<?php

use App\Http\Controllers\CuentaController;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\PersonaController;

Route::get('/', function () {
    return view('welcome');
});
 #estas rutas te muestran el SELECT * FROM persona y SELECT * FROM cuentabancaria
Route::get('/listaPersonas', [PersonaController::class, 'index']);
Route::get('/listaCuentas',[CuentaController::class,'index']);
# ESTA RUTA FUNCIONA PRACTICAMENTE CON SELECT * FROM cuentabancaria where DUI = AL DEL GET
Route::get('/ObtenerCuentasPorDUIs/{DUI_Persona}', [CuentaController::class, 'ObtenerCuentasPorDUIs']);

#Ruta para realizar depositos a una cuenta:
Route::post('/depositar', [CuentaController::class, 'DependienteDelBancoDepositar'])->name('deposito.realizar');
//Los name de los input del form deben ser: ID_Cuenta, y Deposito(tipo number si o si)
//el action del form es /depositar


#Ruta para realizar retiros a una cuenta:
Route::post('/retirar', [CuentaController::class, 'DependienteDelBancoRetirar'])->name('retirar.realizar');
//Los name de los input del form deben ser: ID_Cuenta, y Retiro(tipo number si o si)
//el action del form es /retirar

