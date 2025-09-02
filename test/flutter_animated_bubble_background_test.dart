import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animated_bubble_background/flutter_animated_bubble_background.dart';

void main() {
  group('AnimatedBubbleBackground', () {
    testWidgets('debe renderizar correctamente con parámetros por defecto', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
    });

    testWidgets('debe aceptar un widget hijo', (WidgetTester tester) async {
      const testText = 'Contenido de prueba';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.red, Colors.orange],
              child: const Text(testText),
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    test('debe requerir al menos 2 colores para el degradado', () {
      expect(
        () => AnimatedBubbleBackground(gradientColors: [Colors.blue]),
        throwsAssertionError,
      );
    });

    testWidgets('debe permitir configuración personalizada', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.green, Colors.teal, Colors.blue],
              bubbleCount: 15,
              minBubbleSize: 5.0,
              maxBubbleSize: 30.0,
              speed: 2.0,
              bubbleColor: Colors.yellow,
              bubbleOpacity: 200,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
    });
  });
}
