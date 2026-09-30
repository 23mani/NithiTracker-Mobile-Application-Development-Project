import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/logo_widget.dart';
import '../widgets/animated_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            builder: (context, double value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 30 * (1 - value)), child: child)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: NithiLogo(size: 90)),
                  const SizedBox(height: 50),
                  Text('Welcome Back!', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('Login to continue tracking.', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400]), textAlign: TextAlign.center),
                  const SizedBox(height: 40),
                  TextField(decoration: const InputDecoration(hintText: 'Email / Phone', prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF20C997)))),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF20C997)),
                      suffixIcon: IconButton(icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey), onPressed: () => setState(() => _obscurePassword = !_obscurePassword)),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF20C997), foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 10, shadowColor: const Color(0xFF20C997).withValues(alpha: 0.5),
                    ),
                    child: Text('Login', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),
                  Row(children: [Expanded(child: Divider(color: Colors.grey[800])), Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text('or', style: GoogleFonts.plusJakartaSans(color: Colors.grey[500]))), Expanded(child: Divider(color: Colors.grey[800]))]),
                  const SizedBox(height: 30),
                  Row(children: [Expanded(child: _socialButton(Icons.g_mobiledata, 'Google')), const SizedBox(width: 16), Expanded(child: _socialButton(Icons.facebook, 'Facebook'))]),
                  const SizedBox(height: 40),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Don't have an account? ", style: GoogleFonts.plusJakartaSans(color: Colors.grey[400])),
                    GestureDetector(onTap: () => Navigator.pushNamed(context, '/signup'), child: Text('Sign Up', style: GoogleFonts.plusJakartaSans(color: const Color(0xFF20C997), fontWeight: FontWeight.bold))),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: GoogleFonts.plusJakartaSans(color: Colors.white)),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16), side: BorderSide(color: Colors.grey[800]!), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}