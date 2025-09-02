# Flutter Animated Bubble Background

Un paquete Flutter que proporciona un widget de fondo animado con burbujas flotantes y degradado de colores personalizable.

## Características

- ✨ Fondo con degradado de colores personalizable
- 🫧 Burbujas animadas que flotan automáticamente
- 🏓 Burbujas que rebotan al tocar los bordes de la pantalla
- ⚙️ Configuración personalizable (cantidad, tamaño, velocidad, colores)
- 📱 Responsivo y optimizado para rendimiento
- 🎨 Efecto de brillo realista en las burbujas

## Instalación

Agrega esta línea a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_animated_bubble_background: ^0.0.1
```

Luego ejecuta:

```bash
flutter pub get
```

## Uso básico

```dart
import 'package:flutter/material.dart';
import 'package:flutter_animated_bubble_background/flutter_animated_bubble_background.dart';

class MiPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBubbleBackground(
        gradientColors: [
          Colors.blue,
          Colors.purple,
          Colors.pink,
        ],
        child: Center(
          child: Text(
            '¡Hola Mundo!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

## Configuración avanzada

```dart
AnimatedBubbleBackground(
  gradientColors: [
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.teal,
  ],
  bubbleCount: 30,           // Número de burbujas
  minBubbleSize: 15.0,       // Tamaño mínimo de burbuja
  maxBubbleSize: 50.0,       // Tamaño máximo de burbuja
  speed: 1.5,                // Velocidad de animación
  bubbleColor: Colors.white, // Color de las burbujas
  bubbleOpacity: 0.4,        // Opacidad de las burbujas
  child: TuContenido(),
)
```

## Parámetros

| Parámetro | Tipo | Valor por defecto | Descripción |
|-----------|------|-------------------|-------------|
| `gradientColors` | `List<Color>` | **Requerido** | Lista de colores para el degradado (mínimo 2) |
| `bubbleCount` | `int` | `20` | Número de burbujas a mostrar |
| `minBubbleSize` | `double` | `10.0` | Tamaño mínimo de las burbujas |
| `maxBubbleSize` | `double` | `40.0` | Tamaño máximo de las burbujas |
| `speed` | `double` | `1.0` | Velocidad de movimiento de las burbujas |
| `bubbleColor` | `Color` | `Colors.white` | Color base de las burbujas |
| `bubbleOpacity` | `double` | `0.3` | Opacidad de las burbujas (0.0 - 1.0) |
| `child` | `Widget?` | `null` | Widget que se mostrará encima del fondo |

## Ejemplos de uso

### Fondo de pantalla de inicio
```dart
AnimatedBubbleBackground(
  gradientColors: [Colors.orange, Colors.red],
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.star, size: 100, color: Colors.white),
      Text('Bienvenido', style: TextStyle(fontSize: 30, color: Colors.white)),
    ],
  ),
)
```

### Pantalla de carga
```dart
AnimatedBubbleBackground(
  gradientColors: [Colors.green, Colors.lightGreen],
  bubbleCount: 15,
  speed: 0.5,
  child: Center(
    child: CircularProgressIndicator(color: Colors.white),
  ),
)
```

## Ejecutar el ejemplo

Para probar el paquete, navega a la carpeta `example` y ejecuta:

```bash
cd example
flutter run
```

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.
