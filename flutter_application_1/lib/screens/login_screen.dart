import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC), // Fondo crema claro
      body: Column(
        children: [
          // ===== PARTE SUPERIOR: Título + subtítulo =====
          SizedBox(height: screenHeight * 0.08),
          // Título "Kotoba"
          const Text(
            'Kotoba',
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w900,
              color: Color(0xFF2D2D6D), // Azul oscuro/navy
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          // Subtítulo
          const Text(
            'Tu camino hacia el japones',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4A4A6A),
            ),
          ),

          // ===== PARTE MEDIA: Sol rojo (semicírculo) =====
          const Spacer(),
          // Semicírculo rojo (sol naciente)
          Container(
            width: 180,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFE53935), // Rojo tipo bandera de Japón
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
                topRight: Radius.circular(90),
              ),
            ),
          ),

          // ===== PARTE INFERIOR: Contenedor naranja con botones =====
          Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: const BoxDecoration(
              color: Color(0xFFF5A623), // Naranja
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                // Botón "Iniciar sesión" (oscuro)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Sin acción por ahora
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A3A3A), // Gris oscuro/negro
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Botón "Crea una cuenta" (blanco)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Sin acción por ahora
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF3A3A3A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1.5,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Crea una cuenta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

