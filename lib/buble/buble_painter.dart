import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/buble/buble.dart';

/// Custom painter that renders animated bubbles with realistic visual effects.
///
/// Creates bubbles with radial gradients and highlight reflections to simulate
/// real bubble appearance with light refraction and transparency.
class BubblePainter extends CustomPainter {
  /// List of bubbles to render with their current positions
  final List<Bubble> bubbles;

  /// Base color for bubble rendering
  final Color bubbleColor;

  /// Color for the highlight reflection inside each bubble
  final Color minCircleBubbleColor;

  /// Opacity level for bubbles (0-255 range)
  final int bubbleOpacity;

  /// Creates a bubble painter with the specified visual properties.
  ///
  /// All parameters are required to ensure consistent bubble rendering
  /// across all animation frames.
  BubblePainter({
    required this.bubbles,
    required this.bubbleColor,
    required this.bubbleOpacity,
    required this.minCircleBubbleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      // Create radial gradient for realistic bubble effect
      final gradient = RadialGradient(
        center: Alignment.topLeft,
        radius: 1.0,
        colors: [
          bubbleColor.withAlpha(bubbleOpacity),
          bubbleColor.withAlpha((bubbleOpacity * 0.4).round()),
          bubbleColor.withAlpha((bubbleOpacity * 0.12).round()),
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

      // Draw main bubble with gradient
      canvas.drawCircle(
        Offset(bubble.x, bubble.y),
        bubble.size / 2,
        gradientPaint,
      );

      // Add highlight reflection for realism
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

  /// Always repaint since bubbles are constantly moving
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
