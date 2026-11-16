import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // titulo del menu
              const Text(
                'こんにちは',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF273B68),
                  fontFamily: 'RoundedMplus1c',
                ),
              ),

              const SizedBox(height: 4),

              // el bienvenido de nuevo
              const Text(
                '¡Bienvenido de nuevo!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF273B68),
                ),
              ),

              const SizedBox(height: 24),

              // madre de separador
              Row(
                children: [
                  const Text(
                    '🌸', // vamos a dejar el emoji we porque se ve mejor y es más facil xd
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Explora y aprende',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF273B68),
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // linea gris
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      color: const Color(0xFFDCE2EC),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              //Zona de las tarjetas para el menuuuuu, solo estetico por ahora, luego hacemos que jale a las lecciones y todo eso

              // Tarjeta Hiragana
              //El bloque de la tarjeta
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(252, 178, 104, 1),
                    width: 3,
                  ),
                ),
                //Lo que anda adentro de la tarjeta
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hiragana',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF273B68),
                                fontFamily: 'Nunito',
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Aprende 46\nCaracteres de el\nsilabario katakana',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Color(0xFF5D6B82),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Boton pa comenzar leccion
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        color: const Color.fromRGBO(254, 219, 183, 1),
                        onPressed: () {
                          // Envia a la pantalla de la leccion de hiragana implementar despues
                        },
                        child: const Text(
                          'Comenzar lección',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF273B68),
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
