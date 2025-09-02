/// Example usage of the AnimatedBubbleBackground widget.
///
/// This file demonstrates various configuration options and use cases
/// for the flutter_animated_bubble_background package.

import 'package:flutter/material.dart';
import '../flutter_animated_bubble_background.dart';

/// Example themes that can be used with AnimatedBubbleBackground
class BubbleThemes {
  /// Purple galaxy theme - perfect for entertainment and gaming apps
  static const List<Color> purpleGalaxy = [
    Colors.deepPurple,
    Colors.purple,
    Colors.pinkAccent,
  ];

  /// Tropical sunset theme - ideal for travel and photography apps
  static const List<Color> tropicalSunset = [
    Colors.orange,
    Colors.red,
    Colors.pink,
  ];

  /// Deep ocean theme - great for health and meditation apps
  static const List<Color> deepOcean = [
    Colors.indigo,
    Colors.blue,
    Colors.teal,
  ];

  /// Mystical forest theme - perfect for nature and eco-friendly apps
  static const List<Color> mysticalForest = [
    Color(0xFF2E7D32), // Dark green
    Color(0xFF4CAF50), // Green
    Color(0xFF8BC34A), // Light green
  ];

  /// Basic elegant theme - suitable for corporate and business apps
  static const List<Color> basicElegant = [Colors.blue, Colors.purple];
}

/// Example: Welcome screen with animated bubble background
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: BubbleThemes.purpleGalaxy,
        bubbleCount: 25,
        speed: 1.2,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'Welcome to MyApp',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Discover something amazing',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Example: Loading screen with calming bubble animation
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: BubbleThemes.deepOcean,
        bubbleCount: 15,
        speed: 0.8,
        bubbleOpacity: 100,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
              SizedBox(height: 20),
              Text(
                'Loading...',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Example: Gaming interface with high-energy bubble animation
class GamingInterface extends StatelessWidget {
  const GamingInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: BubbleThemes.tropicalSunset,
        bubbleCount: 40,
        speed: 2.0,
        minBubbleSize: 8.0,
        maxBubbleSize: 60.0,
        bubbleOpacity: 150,
        child: SafeArea(
          child: Column(
            children: [
              // Game header
              Container(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score: 12,450',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Level: 5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Game content area
              const Expanded(
                child: Center(
                  child: Text(
                    'Game Content Here',
                    style: TextStyle(color: Colors.white, fontSize: 24),
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

/// Example: Meditation app with peaceful bubble animation
class MeditationApp extends StatelessWidget {
  const MeditationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: BubbleThemes.mysticalForest,
        bubbleCount: 12,
        speed: 0.4,
        minBubbleSize: 20.0,
        maxBubbleSize: 45.0,
        bubbleOpacity: 80,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.self_improvement, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'Find Your Peace',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Take a deep breath and relax',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Breathe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
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
