import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/animated_background.dart';
import '../widgets/bottom_nav.dart'; // <-- Import the new bottom nav

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Reports', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
        ),
        body: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          builder: (context, double value, child) {
            return Opacity(opacity: value, child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child));
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Period Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _timeChip('Weekly', false),
                    _timeChip('Monthly', true),
                    _timeChip('Yearly', false),
                    _timeChip('Custom', false),
                  ],
                ),
                const SizedBox(height: 30),
                Text('July 2026', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 20),
                
                // Animated Pie Chart
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOutCirc,
                  builder: (context, double value, child) {
                    return SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 60,
                          sections: [
                            PieChartSectionData(color: const Color(0xFF20C997), value: 35 * value, title: '${(35 * value).toInt()}%', radius: 30, titleStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                            PieChartSectionData(color: const Color(0xFF7DE2C1), value: 20 * value, title: '${(20 * value).toInt()}%', radius: 30, titleStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                            PieChartSectionData(color: const Color(0xFFFF9800), value: 15 * value, title: '${(15 * value).toInt()}%', radius: 30, titleStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                            PieChartSectionData(color: Colors.grey, value: 30 * value, title: '${(30 * value).toInt()}%', radius: 30, titleStyle: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _legendItem('Food', const Color(0xFF20C997)),
                    const SizedBox(width: 16),
                    _legendItem('Travel', const Color(0xFF7DE2C1)),
                    const SizedBox(width: 16),
                    _legendItem('Bills', const Color(0xFFFF9800)),
                    const SizedBox(width: 16),
                    _legendItem('Other', Colors.grey),
                  ],
                ),
                const SizedBox(height: 40),
                Text('Expenses Trend', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 20),
                
                // Animated Bar Chart
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1800),
                  curve: Curves.easeOutExpo,
                  builder: (context, double value, child) {
                    return SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround, maxY: 3000, barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
                              const style = TextStyle(color: Colors.grey, fontSize: 12);
                              Widget text;
                              switch (value.toInt()) {
                                case 0: text = const Text('1W', style: style); break;
                                case 1: text = const Text('2W', style: style); break;
                                case 2: text = const Text('3W', style: style); break;
                                case 3: text = const Text('4W', style: style); break;
                                default: text = const Text('', style: style); break;
                              }
                              return SideTitleWidget(axisSide: meta.axisSide, child: text);
                            })),
                            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 1000, getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.withValues(alpha: 0.1), strokeWidth: 1)),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1500 * value, color: const Color(0xFF20C997), width: 20, borderRadius: BorderRadius.circular(4))]),
                            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 2400 * value, color: const Color(0xFF20C997), width: 20, borderRadius: BorderRadius.circular(4))]),
                            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 1800 * value, color: const Color(0xFF20C997), width: 20, borderRadius: BorderRadius.circular(4))]),
                            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 2800 * value, color: const Color(0xFF20C997), width: 20, borderRadius: BorderRadius.circular(4))]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(currentIndex: 1), // <-- Fixed error here
      ),
    );
  }

  Widget _timeChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: isSelected ? const Color(0xFF20C997) : const Color(0xFF10201A).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: GoogleFonts.plusJakartaSans(color: isSelected ? Colors.black : Colors.grey[400], fontWeight: FontWeight.w600, fontSize: 13)),
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(children: [
      Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label, style: GoogleFonts.plusJakartaSans(color: Colors.grey[400], fontSize: 12)),
    ]);
  }
}