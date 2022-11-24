import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/responsive.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: ResponsiveWidget.isSmallScreen(context)
        ? IconButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          )
        : Container(),
    elevation: 0,
    title: Row(
      children: [
        const Visibility(
          child: CustomText(
            text: 'Talha Solutions',
            color: AppStyles.lightGrey,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: AppStyles.dark.withOpacity(0.7),
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: AppStyles.dark.withOpacity(0.7),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppStyles.active,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppStyles.light, width: 2),
                ),
              ),
            )
          ],
        ),
        Container(
          width: 1,
          height: 22,
          color: AppStyles.lightGrey,
        ),
        const SizedBox(width: 24),
        const CustomText(text: "Talha Patel", color: AppStyles.lightGrey),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: const CircleAvatar(
              backgroundColor: AppStyles.light,
              child: Icon(
                Icons.person_outline,
                color: AppStyles.dark,
              ),
            ),
          ),
        ),
      ],
    ),
    iconTheme: const IconThemeData(color: AppStyles.dark),
    backgroundColor: Colors.transparent,
  );
}
