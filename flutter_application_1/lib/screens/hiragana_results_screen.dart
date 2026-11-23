import 'package:flutter/material.dart';
import 'hiragana_lesson_screen.dart';

class HiraganaResultsScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctCount;

  const HiraganaResultsScreen({
    super.key,
    required this.totalQuestions,
    required this.correctCount,
  });

  @override
  Widget build(BuildContext context) {
    final incorrectCount = totalQuestions - correctCount;
    // calcular el porcentaje de respuestas correctas
    final percentage = totalQuestions > 0
        ? (correctCount / totalQuestions * 100).round()
        : 0;

    // Título según el rendimiento
    String title;
    if (percentage == 100) {
      title = '¡Perfecto!';
    } else if (percentage >= 80) {
      title = '¡Excelente!';
    } else if (percentage >= 60) {
      title = '¡Buen trabajo!';
    } else {
      title = '¡Sigue practicando!';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const Spacer(),

              // Título de resultado
              Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF273B68),
                ),
              ),
              const SizedBox(height: 8),

              // Subtítulo
              const Text(
                'Haz terminado tu lección',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5D6B82),
                ),
              ),
              const SizedBox(height: 40),

              // Círculo con el porcentaje
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF4CAF50),
                    width: 8,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF273B68),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Tarjetas de estadísticas
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon:      Icons.check_circle_outline,
                      iconColor: const Color(0xFF4CAF50),
                      count:     correctCount,
                      label:     'Respuestas\ncorrectas',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      icon:      Icons.cancel_outlined,
                      iconColor: const Color(0xFFE53935),
                      count:     incorrectCount,
                      label:     'Respuestas\nIncorrectas',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Tarjeta de consejo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFFFF9800),
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '¡Sigue practicando!\nRepasa los caracteres que\naún necesitas dominar.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF5D6B82),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Botón para regresar a la pantalla del silabario
              MaterialButton(
                minWidth: double.infinity,
                height: 56,
                color: const Color(0xFF4CAF50),
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () {
                  // Regresa al menú del silabario hiragana
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HiraganaLessonScreen(),
                    ),
                    (route) => route.isFirst,
                  );
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // Tarjeta de estadística individual
  Widget _buildStatCard({
    required IconData icon,
    required Color    iconColor,
    required int      count,
    required String   label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDCE2EC)),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF273B68),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF5D6B82),
            ),
          ),
        ],
      ),
    );
  }
}
