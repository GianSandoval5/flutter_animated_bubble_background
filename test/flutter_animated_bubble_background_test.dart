import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_animated_bubble_background/flutter_animated_bubble_background.dart';

void main() {
  group('AnimatedBubbleBackground Widget Tests', () {
    testWidgets('should render correctly with default parameters', (
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

      // Verify the widget builds without throwing
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should accept and display child widget', (
      WidgetTester tester,
    ) async {
      const testText = 'Test Content';

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
      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
    });

    testWidgets('should handle multiple gradient colors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should accept custom configuration parameters', (
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
              minCircleBubbleColor: Colors.white,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle zero speed parameter', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
              speed: 0.0,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle extreme bubble count', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
              bubbleCount: 1,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should handle opacity boundaries', (
      WidgetTester tester,
    ) async {
      // Test minimum opacity
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
              bubbleOpacity: 0,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);

      // Test maximum opacity
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
              bubbleOpacity: 255,
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });

  group('AnimatedBubbleBackground Validation Tests', () {
    test('should require at least 2 colors for gradient', () {
      expect(
        () => AnimatedBubbleBackground(gradientColors: [Colors.blue]),
        throwsAssertionError,
      );
    });

    test('should accept exactly 2 colors', () {
      expect(
        () =>
            AnimatedBubbleBackground(gradientColors: [Colors.blue, Colors.red]),
        returnsNormally,
      );
    });

    test('should accept more than 2 colors', () {
      expect(
        () => AnimatedBubbleBackground(
          gradientColors: [Colors.blue, Colors.red, Colors.green],
        ),
        returnsNormally,
      );
    });

    test('should have sensible default values', () {
      final widget = AnimatedBubbleBackground(
        gradientColors: [Colors.blue, Colors.red],
      );

      expect(widget.bubbleCount, equals(20));
      expect(widget.minBubbleSize, equals(10.0));
      expect(widget.maxBubbleSize, equals(40.0));
      expect(widget.speed, equals(1.0));
      expect(widget.bubbleColor, equals(Colors.white));
      expect(widget.bubbleOpacity, equals(100));
      expect(widget.minCircleBubbleColor, equals(Colors.white));
      expect(widget.child, isNull);
    });
  });

  group('AnimatedBubbleBackground Performance Tests', () {
    testWidgets('should handle layout changes gracefully', (
      WidgetTester tester,
    ) async {
      Widget buildWidget(double width, double height) {
        return MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: width,
              height: height,
              child: AnimatedBubbleBackground(
                gradientColors: [Colors.blue, Colors.purple],
              ),
            ),
          ),
        );
      }

      // Test with small size
      await tester.pumpWidget(buildWidget(100, 100));
      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();

      // Test with large size
      await tester.pumpWidget(buildWidget(800, 600));
      expect(find.byType(AnimatedBubbleBackground), findsOneWidget);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });

    testWidgets('should animate smoothly over time', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedBubbleBackground(
              gradientColors: [Colors.blue, Colors.purple],
              bubbleCount: 5,
            ),
          ),
        ),
      );

      // Pump initial frame
      await tester.pump();
      expect(tester.takeException(), isNull);

      // Pump several animation frames
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        expect(tester.takeException(), isNull);
      }
    });
  });
}
