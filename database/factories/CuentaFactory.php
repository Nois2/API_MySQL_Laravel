<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cuenta>
 */
class CuentaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'ID_Cuenta' => $this->faker->idCuenta(),
            'DUI_Persona' => $this->faker->duiPersona(),
            'Saldo' => $this->faker->saldo(),
            'Estado_cuenta' => $this->faker->estadoCuenta(),
        ];
    }
}
