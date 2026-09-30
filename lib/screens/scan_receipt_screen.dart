import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';

class ScanReceiptScreen extends StatelessWidget {
  const ScanReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Scan Receipt', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)), leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: 1.0),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutBack,
                builder: (context, double value, child) => Transform.scale(scale: value, child: child),
                child: Container(
                  width: 300, height: 400,
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFF20C997), width: 2), borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.receipt_long, size: 80, color: const Color(0xFF20C997).withValues(alpha: 0.5)),
                    const SizedBox(height: 20),
                    Text('Align receipt in frame', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400])),
                  ])),
                ),
              ),
              const SizedBox(height: 40),
              FloatingActionButton.large(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Camera & ML Integration goes here!'))),
                backgroundColor: const Color(0xFF20C997),
                child: const Icon(Icons.camera_alt, size: 40, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}