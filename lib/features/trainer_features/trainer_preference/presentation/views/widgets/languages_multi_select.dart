import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class LanguagesMultiSelect extends StatefulWidget {
  final List<String> items;
  const LanguagesMultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LanguagesMultiSelectState();
}

class _LanguagesMultiSelectState extends State<LanguagesMultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: Text('Select Languages', style: TextStyles.textStyleRegular.copyWith(color: Colors.black)),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    activeColor: AppColors.p300PrimaryColor,
                    title: Text(
                      item,
                      style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: _cancel,
              child: Text(
                'Cancel',
                style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.p300PrimaryColor),
              ),
            ),
            TextButton(
              onPressed: _submit,
              child: Text(
                'Submit',
                style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.p300PrimaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
