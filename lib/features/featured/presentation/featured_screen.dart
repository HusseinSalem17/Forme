import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/featured/presentation/widgets/filter_type.dart';

class FeaturedScreen extends StatelessWidget {
  static const routeName = '/featured-screen';
  final List<String> filterTypes;
  final String featureType;
  const FeaturedScreen(
      {super.key, required this.filterTypes, required this.featureType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context, featureType),
        body: Padding(
          padding:
              EdgeInsets.only(top: 32.h, bottom: 16.h, left: 24.h, right: 24.h),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    filterTypes.length,
                    (int index) {
                      return filterType(filterTypes[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }

  
}
