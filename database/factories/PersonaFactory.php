<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Persona>
 */
class PersonaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'DUI' => $this->faker->dui(),
            'PrimerNombre' => $this->faker->pNombre(),
            'SegundoNombre' => $this->faker->sNombre(),
            'PrimerApellido' => $this->faker->pApellido(),
            'SegundoApellido' => $this->faker->sApellido(),
            'Fechanac' => $this->faker->fechaNac(),
            'telefono' => $this->faker->telefono(),
            'Correo' => $this->faker->correo(),
            'Direccion' => $this->faker->direccion(),
        ];
    }
}
