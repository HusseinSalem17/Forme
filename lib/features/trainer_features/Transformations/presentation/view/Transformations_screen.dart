import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/screens/add_transformation.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/screens/edit_transformation.dart';

class TransformationsScreen extends StatefulWidget {
  static const routeName = '/transformation-screen';
  const TransformationsScreen({Key? key}) : super(key: key);

  @override
  State<TransformationsScreen> createState() => _TransformationsScreenState();
}

class _TransformationsScreenState extends State<TransformationsScreen> {
  @override
  Widget build(BuildContext context) {
    int listLength = 4;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CustomAppBarArrowButton(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Text(
              "Transformations",
              style: TextStyles.textStyleBold.copyWith(
                fontSize: 18.sp,
                color: AppColors.n900Black,
              ),
            ),
            const Spacer(),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.dg),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.n50dropShadowColor.withOpacity(0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/image/Icon/add.svg",
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(PageSlideTransition(
                    const AddTransformation(title: 'Add Transformation')));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: listLength,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageSlideTransition(
                    const EditTransformation(),
                  ),
                );
              },
              child: Image.asset('assets/image/temp/image$index.png'),
            ),
          ),
          if (listLength == 0)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/image/Icon/empty_icon.svg'),
                  const SizedBox(height: 8),
                  Text(
                    'Sorry, on content here!',
                    style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.n900Black,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
