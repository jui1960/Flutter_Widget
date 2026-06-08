import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1A1A2E), // Dark background to make it pop
        body: Center(
          child: RippleAnimation(),
        ),
      ),
    );
  }
}

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 1. Controller controls the duration and loops continuously
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // .repeat() makes it loop forever
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2. AnimatedBuilder listens to the controller and rebuilds the custom paint
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          // Pass the controller value (0.0 to 1.0) into our custom painter
          painter: RipplePainter(_controller.value),
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 32),
          ),
        );
      },
    );
  }
}

// 3. The CustomPainter handles drawing the expanding, fading circles
class RipplePainter extends CustomPainter {
  final double animationValue;

  RipplePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Center point of our canvas
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Max radius the ripple will reach
    final double maxRadius = size.width * 2.5;

    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // We can draw multiple ripples by offsetting the animation value
    for (int i = 0; i < 3; i++) {
      // Stagger the ripples
      double progress = animationValue - (i / 3);
      if (progress < 0) progress += 1.0;

      // Radius goes from 40 (button edge) to maxRadius
      double radius = 40 + (progress * (maxRadius - 40));

      // Opacity goes from 1.0 (fully visible) to 0.0 (invisible) as it expands
      paint.color = Colors.blue.withOpacity(1.0 - progress);

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant RipplePainter oldDelegate) {
    // Repaint whenever the animation value changes
    return oldDelegate.animationValue != animationValue;
  }
}