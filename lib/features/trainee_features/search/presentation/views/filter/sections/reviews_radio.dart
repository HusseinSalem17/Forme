// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:forme_app/core/utils/app_colors.dart';
// import 'package:forme_app/core/utils/text_styles.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';
//
// class ReviewsRadio extends StatefulWidget {
//   const ReviewsRadio({super.key});
//
//   @override
//   State<ReviewsRadio> createState() => _ReviewsRadioState();
// }
//
// class _ReviewsRadioState extends State<ReviewsRadio> {
//   int reviews = 5;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SimpleStarRating(
//                   allowHalfRating: true,
//                   starCount: 5,
//                   rating: 4.5,
//                   size: 16,
//                   filledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.starColor,
//                   ),
//                   nonFilledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.n20Gray,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Text('4.5 and above',
//                     style: TextStyles.textStyleRegular
//                         .copyWith(color: AppColors.n900Black)),
//               ],
//             ),
//             Radio(
//               activeColor: AppColors.primaryColor,
//               value: 5,
//               groupValue: reviews,
//               onChanged: (value) {
//                 setState(() {
//                   reviews = value!;
//                   print('$reviews');
//                 });
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SimpleStarRating(
//                   allowHalfRating: true,
//                   starCount: 5,
//                   rating: 4,
//                   size: 16,
//                   filledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.starColor,
//                   ),
//                   nonFilledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.n20Gray,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Text('4 - 4.5',
//                     style: TextStyles.textStyleRegular
//                         .copyWith(color: AppColors.n900Black)),
//               ],
//             ),
//             Radio(
//               activeColor: AppColors.primaryColor,
//               value: 4,
//               groupValue: reviews,
//               onChanged: (value) {
//                 setState(() {
//                   reviews = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SimpleStarRating(
//                   allowHalfRating: true,
//                   starCount: 5,
//                   rating: 3.5,
//                   size: 16,
//                   filledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.starColor,
//                   ),
//                   nonFilledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.n20Gray,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Text('3.5 - 4',
//                     style: TextStyles.textStyleRegular
//                         .copyWith(color: AppColors.n900Black)),
//               ],
//             ),
//             Radio(
//               activeColor: AppColors.primaryColor,
//               value: 3,
//               groupValue: reviews,
//               onChanged: (value) {
//                 setState(() {
//                   reviews = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SimpleStarRating(
//                   allowHalfRating: true,
//                   starCount: 5,
//                   rating: 3,
//                   size: 16,
//                   filledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.starColor,
//                   ),
//                   nonFilledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.n20Gray,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Text('3 - 3.5',
//                     style: TextStyles.textStyleRegular
//                         .copyWith(color: AppColors.n900Black)),
//               ],
//             ),
//             Radio(
//               activeColor: AppColors.primaryColor,
//               value: 2,
//               groupValue: reviews,
//               onChanged: (value) {
//                 setState(() {
//                   reviews = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SimpleStarRating(
//                   allowHalfRating: true,
//                   starCount: 5,
//                   rating: 2.5,
//                   size: 16,
//                   filledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.starColor,
//                   ),
//                   nonFilledIcon: const Icon(
//                     Icons.star_rate_rounded,
//                     color: AppColors.n20Gray,
//                   ),
//                 ),
//                 SizedBox(width: 16.w),
//                 Text('2 - 2.5',
//                     style: TextStyles.textStyleRegular
//                         .copyWith(color: AppColors.n900Black)),
//               ],
//             ),
//             Radio(
//               activeColor: AppColors.primaryColor,
//               value: 1,
//               groupValue: reviews,
//               onChanged: (value) {
//                 setState(() {
//                   reviews = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
