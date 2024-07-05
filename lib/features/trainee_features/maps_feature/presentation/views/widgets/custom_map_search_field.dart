import 'package:flutter/material.dart';

class CustomMapSearchField extends StatelessWidget {
  final TextEditingController searchController;

  const CustomMapSearchField({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        hintText: 'Search here',
        fillColor: Colors.white,
        filled: true,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
