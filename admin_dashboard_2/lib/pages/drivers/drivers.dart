import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/helpers/responsive.dart';
import 'package:dashboard/pages/drivers/widgets/drivers_table.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

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
            children: const [
              SizedBox(
                height: 600,
                child: DriversTable(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
