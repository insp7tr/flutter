import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/widgets/chart.dart';
import 'package:admin_dashboard/widgets/storage_info_card.dart';
import 'package:flutter/material.dart';

class StorageDetailsCard extends StatelessWidget {
  const StorageDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Storage Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Document Files",
            numOfFiles: 1329,
            amountOfFiles: "1.3GB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Media Files",
            numOfFiles: 1328,
            amountOfFiles: "15.3GB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Other Files",
            numOfFiles: 1328,
            amountOfFiles: "1.3GB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            numOfFiles: 140,
            amountOfFiles: "1.3GB",
          ),
        ],
      ),
    );
  }
}
