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

