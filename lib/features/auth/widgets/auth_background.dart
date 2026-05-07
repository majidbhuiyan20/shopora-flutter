import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// MAIN BACKGROUND
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  const Color(0xffFFF6EF),
                  AppColors.primaryColor.withOpacity(0.08),
                  Colors.white,
                ],
              ),
            ),
          ),

          /// TOP RIGHT GLOW
          Positioned(
            top: -120,
            right: -80,
            child: _GlowCircle(
              size: 280,
              color: AppColors.primaryColor.withOpacity(0.22),
            ),
          ),

          /// TOP LEFT SMALL GLOW
          Positioned(
            top: 80,
            left: -40,
            child: _GlowCircle(
              size: 120,
              color: Colors.orange.withOpacity(0.10),
            ),
          ),

          /// CENTER GLOW
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            right: -60,
            child: _GlowCircle(
              size: 180,
              color: AppColors.primaryColor.withOpacity(0.10),
            ),
          ),

          /// BOTTOM LEFT LARGE GLOW
          Positioned(
            bottom: -140,
            left: -100,
            child: _GlowCircle(
              size: 320,
              color: AppColors.primaryColor.withOpacity(0.18),
            ),
          ),

          /// FLOATING SHAPE 1
          Positioned(
            top: 140,
            right: 40,
            child: _GlassShape(
              height: 80,
              width: 80,
              borderRadius: 24,
              angle: 0.4,
            ),
          ),

          /// FLOATING SHAPE 2
          Positioned(
            bottom: 180,
            left: 30,
            child: _GlassShape(
              height: 60,
              width: 60,
              borderRadius: 18,
              angle: -0.5,
            ),
          ),

          /// FLOATING SHAPE 3
          Positioned(
            bottom: 120,
            right: 50,
            child: _GlassShape(
              height: 100,
              width: 100,
              borderRadius: 30,
              angle: 0.2,
            ),
          ),

          /// LIGHT GRID EFFECT
          CustomPaint(
            size: Size.infinite,
            painter: _GridPainter(),
          ),

          /// CONTENT
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}

/// GLOW CIRCLE
class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            color.withOpacity(0.4),
            color.withOpacity(0.0),
          ],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 80,
          sigmaY: 80,
        ),
        child: Container(),
      ),
    );
  }
}

/// GLASS MORPHIC FLOATING SHAPE
class _GlassShape extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final double angle;

  const _GlassShape({
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 12,
            sigmaY: 12,
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1.5,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.20),
                  Colors.white.withOpacity(0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// SUBTLE GRID PAINTER
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.025)
      ..strokeWidth = 1;

    const spacing = 40.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    for (double j = 0; j < size.height; j += spacing) {
      canvas.drawLine(
        Offset(0, j),
        Offset(size.width, j),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}