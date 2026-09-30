import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NithiLogo extends StatefulWidget {
  final double size;
  const NithiLogo({super.key, this.size = 100});

  @override
  State<NithiLogo> createState() => _NithiLogoState();
}

class _NithiLogoState extends State<NithiLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00A86B), Color(0xFF005A9C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(widget.size * 0.25),
              boxShadow: [
                BoxShadow(color: const Color(0xFF00A86B).withValues(alpha: 0.4), blurRadius: 25, offset: const Offset(0, 10)),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(bottom: widget.size * 0.1, child: Container(width: widget.size * 0.7, height: widget.size * 0.45, decoration: BoxDecoration(color: const Color(0xFFF4F8FC), borderRadius: BorderRadius.circular(widget.size * 0.1)))),
                Positioned(bottom: widget.size * 0.35, left: widget.size * 0.15, child: Container(width: widget.size * 0.4, height: widget.size * 0.2, decoration: BoxDecoration(color: const Color(0xFFE0E7EF), borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.size * 0.1), topRight: Radius.circular(widget.size * 0.1))))),
                Positioned(bottom: widget.size * 0.15, right: widget.size * 0.15, child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  _bar(widget.size * 0.08, widget.size * 0.1, const Color(0xFF00A86B)),
                  const SizedBox(width: 2),
                  _bar(widget.size * 0.08, widget.size * 0.15, const Color(0xFF00A86B)),
                  const SizedBox(width: 2),
                  _bar(widget.size * 0.08, widget.size * 0.22, const Color(0xFF007A5E)),
                ])),
                Positioned(bottom: widget.size * 0.35, right: widget.size * 0.1, child: Transform.rotate(angle: -0.5, child: Icon(Icons.arrow_forward, color: const Color(0xFF00A86B), size: widget.size * 0.25))),
                Positioned(top: widget.size * 0.25, child: Container(width: widget.size * 0.25, height: widget.size * 0.25, decoration: BoxDecoration(color: const Color(0xFFFFC107), shape: BoxShape.circle, border: Border.all(color: const Color(0xFFFFA000), width: 2), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 4, offset: const Offset(0, 2))]), child: Center(child: Text('₹', style: GoogleFonts.plusJakartaSans(fontSize: widget.size * 0.15, fontWeight: FontWeight.bold, color: const Color(0xFF005A9C)))))),
                Positioned(top: widget.size * 0.15, right: widget.size * 0.15, child: Container(width: widget.size * 0.25, height: widget.size * 0.3, decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [_receiptLine(widget.size * 0.15), _receiptLine(widget.size * 0.15), _receiptLine(widget.size * 0.1)]))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: GoogleFonts.plusJakartaSans(fontSize: widget.size * 0.3, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
            children: const [
              TextSpan(text: 'நிதி', style: TextStyle(color: Color(0xFF20C997))),
              TextSpan(text: 'Tracker'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bar(double width, double height, Color color) => Container(width: width, height: height, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))));
  Widget _receiptLine(double width) => Container(width: width, height: 2, margin: const EdgeInsets.symmetric(vertical: 2), decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(2)));
}