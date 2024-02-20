import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_search_delegate.dart';

class FloatingSearchBar extends StatefulWidget {
  const FloatingSearchBar({super.key});

  @override
  FloatingSearchBarState createState() => FloatingSearchBarState();
}

class FloatingSearchBarState extends State<FloatingSearchBar> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Adjust width as needed
      height: 70.h,
      padding: const EdgeInsets.all(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused ? Colors.blue : Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {
              // You can handle onChanged event here
            },
            onTap: () {
              setState(() {
                _isFocused = true;
              });
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            onSubmitted: (value) {
              setState(() {
                _isFocused = false;
              });
              // You can handle onSubmitted event here
            },
            autofocus: false,
          ),
        ),
      ),
    );
  }
}
