// import 'package:flutter/material.dart';
// import 'package:forme_app/core/utils/app_colors.dart';
// import 'package:forme_app/core/utils/text_styles.dart';
// import 'package:forme_app/features/trainee_features/Favorite/data/trainer_card_model.dart';
// import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/professional_card.dart';
// // import 'package:simple_star_rating/simple_star_rating.dart';
//
// class TrainerRemoveCardDecoration extends StatelessWidget {
//   const TrainerRemoveCardDecoration(
//       {super.key, required this.model, required this.size});
//   final TrainerCardModel model;
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       width: size.width,
//       height: size.height / 5,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height / 4,
//               width: MediaQuery.sizeOf(context).width / 4,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   'assets/image/temp/Frame1.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ProfessionalCard(),
//                       Icon(
//                         Icons.favorite,
//                         color: AppColors.primaryColor,
//                         size: 15,
//                       )
//                     ],
//                   ),
//                   Text(
//                     model.name,
//                     style: TextStyles.blackCardTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     'Trainer',
//                     style: TextStyles.cardTextStyle.copyWith(
//                       color: AppColors.n100Gray,
//                       fontSize: 11,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       SimpleStarRating(
//                         allowHalfRating: true,
//                         starCount: 5,
//                         rating: model.rating,
//                         size: 16,
//                         spacing: 2,
//                       ),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                       Text(
//                         '${model.rating}',
//                         style: TextStyles.textStyleRegular
//                             .copyWith(fontSize: 11, color: AppColors.n900Black),
//                       ),
//                       Text(
//                         ' | ',
//                         style: TextStyles.textStyleRegular.copyWith(
//                           fontSize: 11,
//                         ),
//                       ),
//                       Text(
//                         model.reviews,
//                         style: TextStyles.textStyleRegular.copyWith(
//                           fontSize: 11,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
