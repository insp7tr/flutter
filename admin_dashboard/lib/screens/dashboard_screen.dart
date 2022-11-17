import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/widgets/file_info_card.dart';
import 'package:admin_dashboard/widgets/header.dart';
import 'package:admin_dashboard/widgets/my_file.dart';
import 'package:admin_dashboard/widgets/recent_files.dart';
import 'package:admin_dashboard/widgets/storage_details_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const FileInfoCard(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context)) ...[
                        const SizedBox(height: defaultPadding),
                        const StorageDetailsCard(),
                      ],
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context)) ...[
                  const SizedBox(width: defaultPadding),
                  const Expanded(
                    flex: 2,
                    child: StorageDetailsCard(),
                  ),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
