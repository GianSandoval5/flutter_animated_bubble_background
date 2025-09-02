import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/buble/buble.dart';
import 'package:flutter_animated_bubble_background/buble/buble_painter.dart';

/// A Flutter widget that creates an animated background with floating bubbles
/// and customizable gradient colors.
///
/// This widget provides a beautiful animated background perfect for splash screens,
/// login pages, or any screen where you want to add visual appeal.
///
/// The bubbles move with realistic physics, bouncing off screen edges and
/// floating smoothly across the screen.
///
/// Example usage:
/// ```dart
/// AnimatedBubbleBackground(
///   gradientColors: [Colors.blue, Colors.purple, Colors.pink],
///   bubbleCount: 30,
///   child: YourContentWidget(),
/// )
/// ```
class AnimatedBubbleBackground extends StatefulWidget {
  /// List of colors for the background gradient.
  ///
  /// Must contain at least 2 colors. The gradient will blend these colors
  /// from top-left to bottom-right of the screen.
  ///
  /// Example: `[Colors.blue, Colors.purple, Colors.pink]`
  final List<Color> gradientColors;

  /// Number of bubbles to display on screen.
  ///
  /// Recommended range: 10-50 bubbles for optimal performance.
  /// Default: 20
  final int bubbleCount;

  /// Minimum size for bubbles in logical pixels.
  ///
  /// Bubbles will be randomly sized between [minBubbleSize] and [maxBubbleSize].
  /// Recommended range: 5.0-30.0
  /// Default: 10.0
  final double minBubbleSize;

  /// Maximum size for bubbles in logical pixels.
  ///
  /// Bubbles will be randomly sized between [minBubbleSize] and [maxBubbleSize].
  /// Recommended range: 20.0-100.0
  /// Default: 40.0
  final double maxBubbleSize;

  /// Speed multiplier for bubble animation.
  ///
  /// 1.0 = normal speed, 2.0 = double speed, 0.5 = half speed
  /// Recommended range: 0.1-3.0
  /// Default: 1.0
  final double speed;

  /// Optional child widget to display over the animated background.
  ///
  /// This widget will be rendered on top of the bubble animation,
  /// allowing you to add content like text, buttons, or other UI elements.
  final Widget? child;

  /// Base color for the bubbles.
  ///
  /// This color will be modified with the [bubbleOpacity] to create
  /// the final bubble appearance.
  /// Default: Colors.white
  final Color bubbleColor;

  /// Opacity value for bubbles (0-255).
  ///
  /// Higher values make bubbles more opaque, lower values make them more transparent.
  /// Recommended range: 50-200
  /// Default: 100
  final int bubbleOpacity;

  /// Color for the small circle highlight inside each bubble.
  ///
  /// This creates a realistic bubble effect with internal light reflection.
  /// Default: Colors.white
  final Color minCircleBubbleColor;

  /// Creates an animated bubble background widget.
  ///
  /// The [gradientColors] parameter is required and must contain at least 2 colors.
  /// All other parameters are optional and have sensible defaults.
  ///
  /// Throws an [AssertionError] if [gradientColors] contains fewer than 2 colors.
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
         'gradientColors must contain at least 2 colors to create a gradient',
       );

  @override
  State<AnimatedBubbleBackground> createState() =>
      _AnimatedBubbleBackgroundState();
}

/// Private state class for [AnimatedBubbleBackground].
///
/// Manages the animation controller, bubble physics, and rendering updates.
class _AnimatedBubbleBackgroundState extends State<AnimatedBubbleBackground>
    with TickerProviderStateMixin {
  /// Animation controller for smooth 60fps bubble movement
  late AnimationController _controller;

  /// List of bubble objects with position and velocity data
  List<Bubble> bubbles = [];

  /// Random number generator for bubble initialization
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

  /// Initializes bubbles with random positions and velocities.
  ///
  /// Called once when the widget is first built to create the initial
  /// bubble layout within the screen bounds.
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

  /// Updates bubble positions and handles edge collision physics.
  ///
  /// Called every frame to move bubbles according to their velocity
  /// and bounce them off screen edges with realistic physics.
  void _updateBubbles() {
    final size = MediaQuery.of(context).size;

    for (var bubble in bubbles) {
      // Update position based on velocity
      bubble.x += bubble.velocityX;
      bubble.y += bubble.velocityY;

      // Handle horizontal edge collision with bounce
      if (bubble.x <= bubble.size / 2 ||
          bubble.x >= size.width - bubble.size / 2) {
        bubble.velocityX = -bubble.velocityX;
        bubble.x = bubble.x.clamp(
          bubble.size / 2,
          size.width - bubble.size / 2,
        );
      }

      // Handle vertical edge collision with bounce
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
              // Animated bubbles layer
              CustomPaint(
                painter: BubblePainter(
                  bubbles: bubbles,
                  bubbleColor: widget.bubbleColor,
                  bubbleOpacity: widget.bubbleOpacity,
                  minCircleBubbleColor: widget.minCircleBubbleColor,
                ),
                size: constraints.biggest,
              ),

              // Optional child widget overlay
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}
