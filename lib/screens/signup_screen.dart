import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/logo_widget.dart';
import '../widgets/animated_background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context))),
        body: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
          builder: (context, double value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 30 * (1 - value)), child: child)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: NithiLogo(size: 70)),
                const SizedBox(height: 30),
                Text('Create Account', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text('Start your journey to smart spending.', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400])),
                const SizedBox(height: 40),
                TextField(decoration: const InputDecoration(hintText: 'Full Name', prefixIcon: Icon(Icons.person_outline, color: Color(0xFF20C997)))),
                const SizedBox(height: 20),
                TextField(decoration: const InputDecoration(hintText: 'Email', prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF20C997)))),
                const SizedBox(height: 20),
                TextField(obscureText: true, decoration: const InputDecoration(hintText: 'Password', prefixIcon: Icon(Icons.lock_outline, color: Color(0xFF20C997)))),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF20C997), foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('Sign Up', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}