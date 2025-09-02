library flutter_animated_bubble_background;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/buble/buble.dart';
import 'package:flutter_animated_bubble_background/buble/buble_painter.dart';

/// Widget que crea un fondo animado con burbujas flotantes y degradado de colores
class AnimatedBubbleBackground extends StatefulWidget {
  /// Lista de colores para el degradado del fondo
  final List<Color> gradientColors;

  /// Número de burbujas a mostrar
  final int bubbleCount;

  /// Tamaño mínimo de las burbujas
  final double minBubbleSize;

  /// Tamaño máximo de las burbujas
  final double maxBubbleSize;

  /// Velocidad de animación de las burbujas
  final double speed;

  /// Widget hijo que se mostrará encima del fondo
  final Widget? child;

  /// Color de las burbujas
  final Color bubbleColor;

  /// Opacidad de las burbujas
  final int bubbleOpacity;

  /// Color del círculo pequeño en la burbuja
  final Color minCircleBubbleColor;

  const AnimatedBubbleBackground({
    super.key,
    required this.gradientColors,
    this.bubbleCount = 20,
    this.minBubbleSize = 10.0,
    this.maxBubbleSize = 40.0,
    this.speed = 1.0,
    this.child,
    this.bubbleColor = Colors.white,
    this.bubbleOpacity = 100,
    this.minCircleBubbleColor = Colors.white,
  }) : assert(
         gradientColors.length >= 2,
         'Se necesitan al menos 2 colores para el degradado',
       );

  @override
  State<AnimatedBubbleBackground> createState() =>
      _AnimatedBubbleBackgroundState();
}

class _AnimatedBubbleBackgroundState extends State<AnimatedBubbleBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<Bubble> bubbles = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 16), // ~60 FPS
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        _updateBubbles();
      });
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeBubbles(Size size) {
    if (bubbles.isEmpty) {
      bubbles = List.generate(widget.bubbleCount, (index) {
        return Bubble(
          x: random.nextDouble() * size.width,
          y: random.nextDouble() * size.height,
          size:
              widget.minBubbleSize +
              random.nextDouble() *
                  (widget.maxBubbleSize - widget.minBubbleSize),
          velocityX: (random.nextDouble() - 0.5) * 2 * widget.speed,
          velocityY: (random.nextDouble() - 0.5) * 2 * widget.speed,
        );
      });
    }
  }

  void _updateBubbles() {
    final size = MediaQuery.of(context).size;

    for (var bubble in bubbles) {
      // Actualizar posición
      bubble.x += bubble.velocityX;
      bubble.y += bubble.velocityY;

      // Rebotar en los bordes horizontales
      if (bubble.x <= bubble.size / 2 ||
          bubble.x >= size.width - bubble.size / 2) {
        bubble.velocityX = -bubble.velocityX;
        bubble.x = bubble.x.clamp(
          bubble.size / 2,
          size.width - bubble.size / 2,
        );
      }

      // Rebotar en los bordes verticales
      if (bubble.y <= bubble.size / 2 ||
          bubble.y >= size.height - bubble.size / 2) {
        bubble.velocityY = -bubble.velocityY;
        bubble.y = bubble.y.clamp(
          bubble.size / 2,
          size.height - bubble.size / 2,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _initializeBubbles(constraints.biggest);

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.gradientColors,
            ),
          ),
          child: Stack(
            children: [
              // Fondo con degradado (ya está en el Container)

              // Burbujas animadas
              CustomPaint(
                painter: BubblePainter(
                  bubbles: bubbles,
                  bubbleColor: widget.bubbleColor,
                  bubbleOpacity: widget.bubbleOpacity,
                  minCircleBubbleColor: widget.minCircleBubbleColor,
                ),
                size: constraints.biggest,
              ),

              // Widget hijo si se proporciona
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}
