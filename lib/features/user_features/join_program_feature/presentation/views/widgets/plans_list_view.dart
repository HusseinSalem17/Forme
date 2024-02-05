import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class PlansListView extends StatefulWidget {
  const PlansListView({
    Key? key,
  }) : super(key: key);

  @override
  PlansListViewState createState() => PlansListViewState();
}

class PlansListViewState extends State<PlansListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Stack(
                children: [
                  Container(
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.n20FillBodyInBigCardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: selectedIndex == index
                            ? AppColors.p300PrimaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 13,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plan ${index + 1}',
                            style: TextStyles.textStyleRegular.copyWith(
                              color: selectedIndex == index
                                  ? AppColors.p300PrimaryColor
                                  : AppColors.n200BodyContentColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            '1 Month - 20\$',
                            style: TextStyles.textStyleRegular.copyWith(
                              color: AppColors.neutralsN9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 58.h,
                    width: 21.w,
                    decoration: const BoxDecoration(
                      color: AppColors.p300PrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 6,
      ),
    );
  }
}
