import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';
import '../widgets/bottom_nav.dart'; // <-- Import new nav

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Profile', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)), actions: [IconButton(icon: const Icon(Icons.settings, color: Color(0xFF20C997)), onPressed: () {})]),
        body: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
          builder: (context, double value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(children: [
                  CircleAvatar(radius: 35, backgroundColor: const Color(0xFF10201A).withValues(alpha: 0.8), child: const Icon(Icons.person, size: 40, color: Color(0xFF20C997))),
                  const SizedBox(width: 20),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Arjun Verma', style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('arjunverma@gmail.com', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400], fontSize: 13)),
                  ]),
                ]),
                const SizedBox(height: 40),
                _menuItem(Icons.person_outline, 'Personal Information'),
                _menuItem(Icons.account_balance_wallet_outlined, 'Budgets and Limits'),
                _menuItem(Icons.payment, 'Payment Methods'),
                _menuItem(Icons.category_outlined, 'Categories'),
                _menuItem(Icons.security, 'Security', trailing: 'PIN / Biometrics'),
                _menuItem(Icons.notifications_none, 'Notifications'),
                _menuItem(Icons.help_outline, 'Help and Support'),
                _menuItem(Icons.info_outline, 'About NithiTracker'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(currentIndex: 4), // <-- Using new nav
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, {String? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: const Color(0xFF10201A).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF20C997)),
        title: Text(title, style: GoogleFonts.plusJakartaSans(color: Colors.white, fontWeight: FontWeight.w500)),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          if (trailing != null) Text(trailing, style: GoogleFonts.plusJakartaSans(color: Colors.grey[500], fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ]),
        onTap: () {},
      ),
    );
  }
}