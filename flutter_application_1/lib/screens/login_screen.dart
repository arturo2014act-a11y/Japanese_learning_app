import 'package:flutter/material.dart';
import 'login_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: Column(
        children: [
          //PARTE SUPERIOR
          SizedBox(height: screenHeight * 0.12),
          // Título
          const Text(
            'Kotoba',
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: Color(0xFF273B68),
              fontFamily: 'RoundedMplus1c',
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          // Subtítulo
          const Text(
            'Tu camino hacia el japones',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF273B68),
              fontFamily: 'Nunito',
            ),
          ),

          //PARTE MEDIA
          const Spacer(),
          // el semicirculo rojo tipo bandera de Japón
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

          //PARTE INFERIOR
          //Fondo naranja con botones
          Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: const BoxDecoration(
              color: Color(0xFFFCB268), // Naranja
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 100),
                // Boton para iniciar sesion
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  color: const Color(0xFF3A3A3A),
                  textColor: Colors.white,
                  elevation: 5, //esta madre es pa la sombra beto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginFormScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Boton para crear cuenta
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.white,
                  textColor: const Color(0xFF3A3A3A),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1.5,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Crea una cuenta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

