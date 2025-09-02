import 'package:example/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/flutter_animated_bubble_background.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: AppColors.purpleGalaxyGradient,
        bubbleCount: 30,
        minBubbleSize: 10.0,
        maxBubbleSize: 60.0,
        speed: 1.5,
        bubbleColor: Colors.white,
        bubbleOpacity: 180,
        minCircleBubbleColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.all(16.0),
              //   width: double.infinity,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.red, width: 2.0),
              //     borderRadius: BorderRadius.circular(12.0),
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
