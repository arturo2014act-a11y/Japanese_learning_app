import 'package:flutter/material.dart';
import 'menu_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  bool _verContrasena = false;
  bool _recordarCuenta = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body:  SingleChildScrollView(
        child: Column(
            children: [
            SizedBox(height: screenHeight * 0.12),

            const Text(
              'Inicio',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Color(0xFF273B68),
              ),
            ),
            const SizedBox(height: 6),
            // Subtítulo
            const Text(
              'Ingresa tus datos para continuar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF273B68),
                fontFamily: 'Nunito',
              ),
            ),

            const SizedBox(height: 40), 

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

                  // Campo del correo por ahora solo visual luego hacemos que jale
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Campo contra
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      obscureText: !_verContrasena,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _verContrasena ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _verContrasena = !_verContrasena;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Recordar cuenta
                  Row(
                    children: [
                      Checkbox(
                        value: _recordarCuenta,
                        onChanged: (valor) {
                          setState(() {
                            _recordarCuenta = valor ?? false;
                          });
                        },
                        activeColor: const Color(0xFFE53935),
                        side: const BorderSide(color: Colors.white),
                      ),
                      const Text(
                        'Recordar cuenta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Botón Iniciar sesión
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: const Color(0xFFE53935),
                    textColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      //Pa enviarnos al menu screen, luego implementamos la validacion de usuario y contraseña
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
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
                ],
              ),
            ),
        ],
      ),
      )
    );
  }
}
