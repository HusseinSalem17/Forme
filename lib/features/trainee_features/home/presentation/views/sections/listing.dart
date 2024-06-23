// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:forme_app/core/utils/app_colors.dart';
// import 'package:forme_app/core/utils/text_styles.dart';
// import 'package:forme_app/features/trainee_features/home/presentation/views/sections/vertical_list_of_items.dart';
// import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_list.dart';
//
// class Listing extends StatelessWidget {
//   final String title;
//   final bool isVertical;
//   final double listHeight;
//   final void Function()? onTap;
//
//   const Listing({
//     super.key,
//     this.listHeight = 3.5,
//     required this.title,
//     required this.onTap,
//     this.isVertical = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 24.w,
//             vertical: 16.h,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: TextStyles.textStyleBold.copyWith(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14.sp,
//                   color: AppColors.n900Black,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: onTap,
//                 child: Text(
//                   'See all',
//                   style: TextStyles.textStyleRegular.copyWith(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14.sp,
//                     color: AppColors.secondaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.sizeOf(context).height / listHeight,
//           child:
//               isVertical ? const VerticalCardsList() : const ProgramsCardList(),
//         ),
//       ],
//     );
//   }
// }