<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Progress extends Model
{
    use HasFactory;

    // Indicamos el nombre exacto de la tabla en la base de datos
    // (Laravel busca por defecto "progresses", así que forzamos a que use "progress")
    protected $table = 'progress';

    // Campos que permitimos guardar en la tabla progress
    protected $fillable = [
        'user_id',
        'activity_id',
        'stars_earned',
        'is_completed',
    ];

    // Aseguramos que is_completed siempre se trate como verdadero/falso (booleano)
    // y stars_earned como número entero
    protected $casts = [
        'is_completed' => 'boolean',
        'stars_earned' => 'integer',
    ];

    // RELACIÓN: Este progreso le pertenece a un usuario en particular
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // RELACIÓN: Este progreso le pertenece a una actividad o ejercicio en particular
    public function activity()
    {
        return $this->belongsTo(Activity::class);
    }
}

