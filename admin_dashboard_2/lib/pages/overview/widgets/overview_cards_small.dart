import 'package:dashboard/pages/overview/widgets/info_card_small.dart';
import 'package:flutter/material.dart';

class OverviewCardsSmallScreen extends StatelessWidget {
  const OverviewCardsSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoCardSmall(
            title: "Rides in progress",
            value: "7",
            topColor: Colors.orange,
            onTap: () {},
          ),
          SizedBox(height: width / 64),
          InfoCardSmall(
            title: "Packages delivered",
            value: "17",
            topColor: Colors.lightGreen,
            onTap: () {},
          ),
          SizedBox(height: width / 64),
          InfoCardSmall(
            title: "Cancelled deliveries",
            value: "3",
            topColor: Colors.redAccent,
            onTap: () {},
          ),
          SizedBox(height: width / 64),
          InfoCardSmall(
            title: "Scheduled deliveries",
            value: "3",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
