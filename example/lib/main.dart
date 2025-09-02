import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/flutter_animated_bubble_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bubble Background Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Example home screen demonstrating the AnimatedBubbleBackground widget
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
              //AQUI VAN LOS WIDGETS QUE DESEES PONER ENCIMA DE LAS BURBUJAS
            ],
          ),
        ),
      ),
    );
  }
}

//gradient colors de Ejemplos
class AppColors {
  //Ejemplo Básico
  static const List<Color> basicExampleGradient = [Colors.blue, Colors.purple];

  //Atardecer Tropical
  static const List<Color> tropicalSunsetGradient = [
    Colors.orange,
    Colors.red,
    Colors.pink,
  ];

  //Océano Profundo
  static const List<Color> deepOceanGradient = [
    Colors.indigo,
    Colors.blue,
    Colors.teal,
  ];

  //Bosque Místico
  static List<Color> mysticalForestGradient = [
    Colors.green.shade800,
    Colors.green,
    Colors.lightGreen,
  ];

  //Galaxia Violeta
  static const List<Color> purpleGalaxyGradient = [
    Colors.deepPurple,
    Colors.purple,
    Colors.pinkAccent,
  ];
}
