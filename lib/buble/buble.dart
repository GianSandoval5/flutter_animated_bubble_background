/// Represents an individual animated bubble with position and physics properties.
///
/// Each bubble has a position ([x], [y]), size, and velocity components
/// for realistic movement and collision physics.
class Bubble {
  /// Current horizontal position of the bubble center
  double x;

  /// Current vertical position of the bubble center
  double y;

  /// Diameter of the bubble in logical pixels
  final double size;

  /// Horizontal velocity component (pixels per frame)
  double velocityX;

  /// Vertical velocity component (pixels per frame)
  double velocityY;

  /// Creates a new bubble with the specified properties.
  ///
  /// All parameters are required to ensure proper bubble initialization
  /// and physics calculations.
  Bubble({
    required this.x,
    required this.y,
    required this.size,
    required this.velocityX,
    required this.velocityY,
  });
}
