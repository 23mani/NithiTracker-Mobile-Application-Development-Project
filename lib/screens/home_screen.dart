import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground( // <--- Wrapped
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            builder: (context, double value, child) {
              return Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child));
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Hi, Arjun!', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('Welcome back', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400])),
                    ]),
                    CircleAvatar(backgroundColor: const Color(0xFF10201A).withValues(alpha: 0.8), child: IconButton(icon: const Icon(Icons.notifications_outlined, color: Color(0xFF20C997)), onPressed: () {})),
                  ]),
                  const SizedBox(height: 30),
                  // Animated Balance Card
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.easeOutExpo,
                    builder: (context, double value, child) {
                      return Transform.scale(scale: 0.9 + (0.1 * value), child: Opacity(opacity: value, child: child));
                    },
                    child: Container(
                      width: double.infinity, padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF10201A), Color(0xFF1A332A)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 20, offset: const Offset(0, 10))],
                        border: Border.all(color: const Color(0xFF20C997).withValues(alpha: 0.2)),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total Balance', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400], fontSize: 14)),
                        const SizedBox(height: 8),
                        Text('₹ 2,24,560.00', style: GoogleFonts.plusJakartaSans(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(children: [const Icon(Icons.arrow_upward, color: Color(0xFF20C997), size: 16), Text(' 12% vs last month', style: GoogleFonts.plusJakartaSans(color: const Color(0xFF20C997), fontSize: 13, fontWeight: FontWeight.w600))]),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    _quickAction(context, Icons.add, 'Add\nExpense', const Color(0xFF20C997), '/add_expense'),
                    _quickAction(context, Icons.camera_alt_outlined, 'Scan\nReceipt', const Color(0xFF7DE2C1), '/scan_receipt'),
                    _quickAction(context, Icons.track_changes, 'Set\nBudget', const Color(0xFFFF9800), '/reports'),
                    _quickAction(context, Icons.flag_outlined, 'Goals', const Color(0xFFE91E63), '/reports'),
                  ]),
                  const SizedBox(height: 35),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Recent Transactions', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('View all', style: GoogleFonts.plusJakartaSans(color: const Color(0xFF20C997))),
                  ]),
                  const SizedBox(height: 16),
                  _transactionItem('Swiggy', 'Food', '-₹320', 'Today', Icons.fastfood, Colors.orange),
                  const SizedBox(height: 12),
                  _transactionItem('Uber', 'Travel', '-₹150', 'Yesterday', Icons.directions_car, Colors.blue),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNav(context, 0),
      ),
    );
  }

  Widget _quickAction(BuildContext context, IconData icon, String label, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF10201A).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withValues(alpha: 0.3)), boxShadow: [BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 15, offset: const Offset(0, 5))]),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey[300])),
      ]),
    );
  }

  Widget _transactionItem(String title, String subtitle, String amount, String date, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF10201A).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)), Text(subtitle, style: GoogleFonts.plusJakartaSans(color: Colors.grey[500], fontSize: 12))])),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Text(amount, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent)), Text(date, style: GoogleFonts.plusJakartaSans(color: Colors.grey[500], fontSize: 12))]),
      ]),
    );
  }

  Widget _buildBottomNav(BuildContext context, int currentIndex) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(color: const Color(0xFF10201A).withValues(alpha: 0.9), borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 10))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          currentIndex: currentIndex, selectedItemColor: const Color(0xFF20C997), unselectedItemColor: Colors.grey[600], type: BottomNavigationBarType.fixed, backgroundColor: Colors.transparent, elevation: 0,
          onTap: (index) {
            if (index == 0) Navigator.pushReplacementNamed(context, '/home');
            if (index == 1) Navigator.pushReplacementNamed(context, '/reports');
            if (index == 2) Navigator.pushReplacementNamed(context, '/add_expense');
            if (index == 3) Navigator.pushReplacementNamed(context, '/ai_insights');
            if (index == 4) Navigator.pushReplacementNamed(context, '/profile');
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'AI'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}