<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuenta extends Model
{
    protected $table = 'cuentabancaria';
    public $timestamps = false;

    use HasFactory;
}
