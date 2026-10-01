import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../widgets/logo_widget.dart';
import '../widgets/animated_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _isLoading = false;

  // ============================================================
  // 1. EMAIL / PASSWORD LOGIN
  // ============================================================
  Future<void> _loginWithEmail() async {
    // Currently navigating directly to Home.
    // Firebase Email/Password authentication can be added later.
    Navigator.pushReplacementNamed(context, '/home');
  }

  // ============================================================
  // 2. GOOGLE SIGN-IN
  // ============================================================
  Future<void> _signInWithGoogle() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Start Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // User cancelled Google login
      if (googleUser == null) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        return;
      }

      // Get Google authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Go to Home
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Google Sign-In failed: $e'),
          ),
        );
      }
    }
  }

  // ============================================================
  // 3. FACEBOOK SIGN-IN
  // ============================================================
  Future<void> _signInWithFacebook() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Start Facebook Login
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: const [
          'email',
          'public_profile',
        ],
      );

      // User cancelled Facebook login
      if (result.status == LoginStatus.cancelled) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        return;
      }

      // Facebook login failed
      if (result.status != LoginStatus.success) {
        throw Exception(result.message ?? 'Facebook login failed');
      }

      // Get Facebook access token
      final accessToken = result.accessToken;

      if (accessToken == null) {
        throw Exception('Facebook access token is null');
      }

      // Create Firebase Facebook credential
      // NOTE: Using .token instead of the deprecated .tokenString
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.token,
      );

      // Sign in to Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Login successful → Home
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Facebook Sign-In failed: $e'),
          ),
        );
      }
    }
  }

  // ============================================================
  // BUILD LOGIN SCREEN
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ------------------------------------------------
                  // LOGO
                  // ------------------------------------------------
                  const Center(
                    child: NithiLogo(size: 90),
                  ),
                  const SizedBox(height: 50),

                  // ------------------------------------------------
                  // TITLE
                  // ------------------------------------------------
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login to continue tracking.',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // ------------------------------------------------
                  // EMAIL
                  // ------------------------------------------------
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Email / Phone',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF20C997),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // PASSWORD
                  // ------------------------------------------------
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF20C997),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ------------------------------------------------
                  // MAIN LOGIN BUTTON
                  // ------------------------------------------------
                  ElevatedButton(
                    onPressed: _isLoading ? null : _loginWithEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF20C997),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      shadowColor: const Color(0xFF20C997).withOpacity(0.5),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Login',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // OR DIVIDER
                  // ------------------------------------------------
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[800])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[800])),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // SOCIAL LOGIN BUTTONS
                  // ------------------------------------------------
                  Row(
                    children: [
                      Expanded(
                        child: _socialButton(
                          Icons.g_mobiledata,
                          'Google',
                          _signInWithGoogle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _socialButton(
                          Icons.facebook,
                          'Facebook',
                          _signInWithFacebook,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // ------------------------------------------------
                  // SIGN UP
                  // ------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.grey[400],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF20C997),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SOCIAL BUTTON
  // ============================================================
  Widget _socialButton(
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return OutlinedButton.icon(
      onPressed: _isLoading ? null : onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: GoogleFonts.plusJakartaSans(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.grey[800]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}