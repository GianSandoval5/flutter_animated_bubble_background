import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/buble/buble.dart';

/// Painter personalizado para dibujar las burbujas
class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;
  final Color bubbleColor;
  final Color minCircleBubbleColor;
  final int bubbleOpacity;

  BubblePainter({
    required this.bubbles,
    required this.bubbleColor,
    required this.bubbleOpacity,
    required this.minCircleBubbleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      // Crear gradiente radial para efecto de burbuja
      final gradient = RadialGradient(
        center: Alignment.topLeft,
        radius: 1.0,
        colors: [
          bubbleColor.withAlpha(bubbleOpacity * 255),
          bubbleColor.withAlpha(bubbleOpacity * 100),
          bubbleColor.withAlpha(bubbleOpacity * 30),
        ],
        stops: const [0.0, 0.7, 1.0],
      );

      final gradientPaint = Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(
            center: Offset(bubble.x, bubble.y),
            radius: bubble.size / 2,
          ),
        );

      // Dibujar burbuja con gradiente
      canvas.drawCircle(
        Offset(bubble.x, bubble.y),
        bubble.size / 2,
        gradientPaint,
      );

      // Agregar brillo en la parte superior izquierda
      final highlightPaint = Paint()
        ..color = minCircleBubbleColor.withAlpha(bubbleOpacity * 255)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(bubble.x - bubble.size * 0.2, bubble.y - bubble.size * 0.2),
        bubble.size * 0.2,
        highlightPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
