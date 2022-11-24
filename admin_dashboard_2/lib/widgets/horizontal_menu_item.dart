import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? Controllers.menuController.onHover(itemName)
            : Controllers.menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: Controllers.menuController.isHovering(itemName)
              ? AppStyles.lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: Controllers.menuController.isHovering(itemName) ||
                    Controllers.menuController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 6,
                  height: 40,
                  color: AppStyles.dark,
                ),
              ),
              SizedBox(width: width / 88),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Controllers.menuController.returnIconFor(itemName),
              ),
              if (!Controllers.menuController.isActive(itemName))
                Flexible(
                  child: CustomText(
                    text: itemName,
                    color: Controllers.menuController.isHovering(itemName)
                        ? AppStyles.dark
                        : AppStyles.lightGrey,
                  ),
                )
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: AppStyles.dark,
                  size: 18,
                  fontWeight: FontWeight.bold,
                ))
            ],
          ),
        ),
      ),
    );
  }
}
