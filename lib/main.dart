import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/ai_insights_screen.dart';
import 'screens/scan_receipt_screen.dart';
import 'utils/page_transitions.dart'; // Import the transition

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NithiTrackerApp());
}

class NithiTrackerApp extends StatelessWidget {
  const NithiTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'நிதிTracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent, // Important: Transparent for AnimatedBackground
        primaryColor: const Color(0xFF20C997),
        cardColor: const Color(0xFF10201A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF20C997),
          secondary: Color(0xFF7DE2C1),
          surface: Color(0xFF10201A),
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, centerTitle: true, iconTheme: IconThemeData(color: Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF10201A).withValues(alpha: 0.8),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color(0xFF20C997), width: 2)),
          hintStyle: GoogleFonts.plusJakartaSans(color: Colors.grey[500], fontSize: 15),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/': page = const LoginScreen(); break;
          case '/signup': page = const SignUpScreen(); break;
          case '/home': page = const HomeScreen(); break;
          case '/add_expense': page = const AddExpenseScreen(); break;
          case '/reports': page = const ReportsScreen(); break;
          case '/profile': page = const ProfileScreen(); break;
          case '/ai_insights': page = const AiInsightsScreen(); break;
          case '/scan_receipt': page = const ScanReceiptScreen(); break;
          default: page = const LoginScreen();
        }
        return SmoothPageRoute(page: page);
      },
    );
  }
}