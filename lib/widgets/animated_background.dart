import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat(reverse: true);
    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark background
        Container(color: const Color(0xFF08110E)),
        
        // Moving Orb 1 (Emerald Green)
        AnimatedBuilder(
          animation: _animation1,
          builder: (context, child) {
            return Positioned(
              top: -100 + (_animation1.value * 50),
              left: -100 + (_animation1.value * 100),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF20C997).withValues(alpha: 0.15),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF20C997).withValues(alpha: 0.2), blurRadius: 100, spreadRadius: 50),
                  ],
                ),
              ),
            );
          },
        ),
        
        // Moving Orb 2 (Deep Blue)
        AnimatedBuilder(
          animation: _animation2,
          builder: (context, child) {
            return Positioned(
              bottom: -100 + (_animation2.value * 100),
              right: -100 + (_animation2.value * 50),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF005A9C).withValues(alpha: 0.15),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF005A9C).withValues(alpha: 0.2), blurRadius: 120, spreadRadius: 60),
                  ],
                ),
              ),
            );
          },
        ),
        
        // The actual screen content
        widget.child,
      ],
    );
  }
}