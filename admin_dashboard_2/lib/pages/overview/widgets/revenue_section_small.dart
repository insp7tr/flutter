import 'package:dashboard/constants/style.dart';
import 'package:dashboard/pages/overview/widgets/bar_chart.dart';
import 'package:dashboard/pages/overview/widgets/revenue_info.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RevenueSectionSmall extends StatelessWidget {
  const RevenueSectionSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppStyles.lightGrey.withOpacity(0.1),
              blurRadius: 12),
        ],
        border: Border.all(
          color: AppStyles.lightGrey,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomText(
                  text: "Revenue Chart",
                  size: 20,
                  fontWeight: FontWeight.bold,
                  color: AppStyles.lightGrey,
                ),
                SizedBox(
                  width: 600,
                  height: 200,
                  child: SimpleBarChart.withSampleData(),
                )
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: AppStyles.lightGrey,
          ),
          SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    RevenueInfo(title: "Today's revenue", amount: "23"),
                    RevenueInfo(title: "Last 7 days", amount: "150"),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    RevenueInfo(title: "Last 30 days", amount: "1203"),
                    RevenueInfo(title: "Last 12 months", amount: "3234"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
