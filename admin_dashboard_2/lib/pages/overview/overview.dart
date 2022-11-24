import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/helpers/responsive.dart';
import 'package:dashboard/pages/overview/widgets/available_drivers.dart';
import 'package:dashboard/pages/overview/widgets/overview_cards_large.dart';
import 'package:dashboard/pages/overview/widgets/overview_cards_medium.dart';
import 'package:dashboard/pages/overview/widgets/overview_cards_small.dart';
import 'package:dashboard/pages/overview/widgets/revenue_section_large.dart';
import 'package:dashboard/pages/overview/widgets/revenue_section_small.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 13,
                ),
                child: CustomText(
                  text: Controllers.menuController.activeItem.value,
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context)) ...[
                  const OverviewCardsMediumScreen(),
                  const RevenueSectionSmall(),
                ] else ...[
                  const OverviewCardsLargeScreen(),
                  const RevenueSectionLarge(),
                ]
              else ...[
                const OverviewCardsSmallScreen(),
                const RevenueSectionSmall(),
              ],
              Row(
                children: const [
                  SizedBox(width: 10),
                  CustomText(
                    text: "Available Drivers",
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: 312,
                child: AvailableDriversTable(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
