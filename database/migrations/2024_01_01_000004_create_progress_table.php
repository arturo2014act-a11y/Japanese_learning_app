<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Corre las migraciones para crear la tabla de progreso.
     */
    public function up(): void
    {
        Schema::create('progress', function (Blueprint $table) {
            // ID único de este registro de progreso
            $table->id();

            // Llave foránea: usuario al que le pertenece este avance
            // Si el usuario es borrado, se borra su progreso asociado
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();

            // Llave foránea: actividad o ejercicio que realizó el usuario
            // Si se borra la actividad, se borra este progreso
            $table->foreignId('activity_id')->constrained('activities')->cascadeOnDelete();

            // Número de estrellas que ganó el usuario (inicia en 0)
            $table->integer('stars_earned')->default(0);

            // Indica si el usuario ya terminó el ejercicio (false = no, true = sí)
            $table->boolean('is_completed')->default(false);

            // Guarda cuándo empezó o actualizó su progreso (created_at, updated_at)
            $table->timestamps();
        });
    }

    /**
     * Revierte las migraciones (elimina la tabla).
     */
    public function down(): void
    {
        Schema::dropIfExists('progress');
    }
};

