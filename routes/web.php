<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\PersonaController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/listaPersonas', [PersonaController::class, 'index']);

