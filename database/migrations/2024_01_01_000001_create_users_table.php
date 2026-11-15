<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Corre las migraciones para crear la tabla de usuarios.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            // ID principal numérico y autoincremental
            $table->id();

            // Nombre completo o apodo del estudiante
            $table->string('name');

            // Correo electrónico (debe ser único, no se puede repetir en la base de datos)
            $table->string('email')->unique();

            // Fecha en que verificó su correo (opcional por defecto en Laravel)
            $table->timestamp('email_verified_at')->nullable();

            // Contraseña del usuario (se guarda encriptada)
            $table->string('password');

            // Token para mantener la sesión iniciada
            $table->rememberToken();

            // Columnas created_at y updated_at para saber cuándo se registró y cuándo actualizó su perfil
            $table->timestamps();
        });
    }

    /**
     * Revierte las migraciones (elimina la tabla).
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};

