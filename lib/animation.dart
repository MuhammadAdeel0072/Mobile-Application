import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  double _size = 150;
  double _rotation = 0;
  double _radius = 20;
  bool _isAnimated = false;

  Color _color = Colors.blue;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _animateBox() {
    setState(() {
      _isAnimated = !_isAnimated;

      if (_isAnimated) {
        _size = 200;
        _rotation = math.pi / 4;
        _radius = 100;
        _color = Colors.deepPurple;
        _controller.forward();
      } else {
        _size = 150;
        _rotation = 0;
        _radius = 20;
        _color = Colors.blue;
        _controller.reverse();
      }
    });
  }

  void _resetAnimation() {
    setState(() {
      _isAnimated = false;
      _size = 150;
      _rotation = 0;
      _radius = 20;
      _color = Colors.blue;
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Flutter Animation Demo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 24),

          const Text(
            'Flutter Animation Concepts',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          // 1. AnimatedContainer + AnimatedRotation
          AnimatedRotation(
            turns: _rotation / (2 * math.pi),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              height: _size,
              width: _size,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_radius),
                boxShadow: [
                  BoxShadow(
                    color: _color.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Icon(
                    Icons.flutter_dash,
                    color: Colors.white,
                    size: 75,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            'Size • Color • Rotation • Shape • Scale',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 25),

          // 2. Button animation control
          ElevatedButton.icon(
            onPressed: _animateBox,
            icon: Icon(_isAnimated ? Icons.refresh : Icons.play_arrow),
            label: Text(_isAnimated ? 'Reverse Animation' : 'Start Animation'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
          ),

          const SizedBox(height: 12),

          // 3. Reset button
          TextButton(
            onPressed: _resetAnimation,
            child: const Text('Reset Animation'),
          ),
        ],
      ),
    );
  }
}
