import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_background.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Add Expense', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)), leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context))),
        body: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
          builder: (context, double value, child) => Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(children: [
                    Text('Amount', style: GoogleFonts.plusJakartaSans(color: Colors.grey[400])),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: '850.00', textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(fontSize: 48, fontWeight: FontWeight.bold, color: const Color(0xFF20C997)),
                      decoration: const InputDecoration(prefixText: '₹ ', prefixStyle: TextStyle(fontSize: 32, color: Color(0xFF20C997)), border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
                      keyboardType: TextInputType.number,
                    ),
                  ]),
                ),
                const SizedBox(height: 30),
                Text('Category', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _categoryChip(Icons.fastfood, 'Food', true),
                    _categoryChip(Icons.directions_car, 'Travel', false),
                    _categoryChip(Icons.shopping_bag, 'Shopping', false),
                    _categoryChip(Icons.receipt_long, 'Bills', false),
                    _categoryChip(Icons.more_horiz, 'More', false),
                  ]),
                ),
                const SizedBox(height: 30),
                Text('Date', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                TextField(readOnly: true, decoration: const InputDecoration(hintText: '22 June 2026', prefixIcon: Icon(Icons.calendar_today, color: Color(0xFF20C997)), suffixIcon: Icon(Icons.keyboard_arrow_down))),
                const SizedBox(height: 20),
                Text('Payment Method (Optional)', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                TextField(decoration: const InputDecoration(hintText: 'UPI / Bank', prefixIcon: Icon(Icons.account_balance, color: Color(0xFF20C997)), suffixIcon: Icon(Icons.keyboard_arrow_down))),
                const SizedBox(height: 20),
                Text('Notes (Optional)', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                TextField(maxLines: 3, decoration: const InputDecoration(hintText: 'Add a note...')),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF20C997), foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Text('Save Expense', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(IconData icon, String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: isSelected ? const Color(0xFF20C997).withValues(alpha: 0.2) : const Color(0xFF10201A).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(16), border: Border.all(color: isSelected ? const Color(0xFF20C997) : Colors.transparent)),
      child: Column(children: [
        Icon(icon, color: isSelected ? const Color(0xFF20C997) : Colors.grey[400]),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.plusJakartaSans(color: isSelected ? const Color(0xFF20C997) : Colors.grey[400], fontSize: 12, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}