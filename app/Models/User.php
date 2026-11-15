<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    // Campos que permitimos llenar de forma directa (por ejemplo al registrar al usuario)
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    // Ocultar datos sensibles al convertir este modelo a formato JSON (para la app móvil)
    protected $hidden = [
        'password',
        'remember_token',
    ];

    // Conversión automática de tipos de datos
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    // RELACIÓN: Un usuario puede tener muchos registros de progreso en distintas actividades
    public function progress()
    {
        return $this->hasMany(Progress::class);
    }
}

