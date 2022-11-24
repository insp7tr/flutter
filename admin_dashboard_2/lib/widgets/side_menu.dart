import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/responsive.dart';
import 'package:dashboard/routes/routes.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:dashboard/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: AppStyles.light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    const Flexible(
                      child: CustomText(
                        text: "Talha Solutions",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: AppStyles.active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authenticationPageRoute) {
                        Controllers.menuController
                            .changeActiveItemTo(overViewPageDisplayName);

                        Get.offAllNamed(authenticationPageRoute);
                      }

                      if (!Controllers.menuController.isActive(item.name)) {
                        Controllers.menuController
                            .changeActiveItemTo(item.name);

                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        Controllers.navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
