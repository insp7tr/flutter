import 'package:dashboard/constants/style.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ClientsTable extends StatelessWidget {
  const ClientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppStyles.active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppStyles.lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text("Name"),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Location'),
          ),
          DataColumn(
            label: Text('Rating'),
          ),
          DataColumn(
            label: Text('Action'),
          ),
        ],
        rows: List<DataRow>.generate(
          7,
          (index) => DataRow(
            cells: [
              const DataCell(CustomText(text: "Talha Patel")),
              const DataCell(CustomText(text: "Sandton")),
              DataCell(Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "4.5",
                  )
                ],
              )),
              DataCell(
                Container(
                  decoration: BoxDecoration(
                    color: AppStyles.light,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppStyles.active, width: .5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: CustomText(
                    text: "Block Client",
                    color: AppStyles.active.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
