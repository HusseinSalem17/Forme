import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTable {
  Widget buildTable() {
    return Table(
      border: const TableBorder(
        top: BorderSide(
          color: Color(0xFFEBECEE),
          width: 1.2,
        ),
      ),
      children: [
        TableRow(
          children: [
            buildTableCell('4 Week', 'Duration', isFirstColumn: true),
            buildTableCell('18-70', 'Age'),
            buildTableCell('All', 'Gender', isLastColumn: true),
          ],
        ),
      ],
    );
  }

  Widget buildTableCell(
    String firstText,
    String secondText, {
    bool isFirstColumn = false,
    bool isLastColumn = false,
  }) {
    BorderSide borderSide = const BorderSide(
      color: Color(0xFFEBECEE),
      width: 1.2,
    );

    if (isFirstColumn) {
      borderSide = const BorderSide(
        color: Color(0xFFEBECEE),
        width: 0.0,
      );
    }

    if (isLastColumn) {
      borderSide = const BorderSide(
        color: Color(0xFFEBECEE),
        width: 0.0,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: const BorderSide(
            color: Color(0xFFEBECEE),
            width: 1.2,
          ),
          left: borderSide,
          right: borderSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            children: [
              Text(
                firstText,
                style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.n900Black,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                secondText,
                style: TextStyles.textStyleRegular
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
