// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:searchfield/searchfield.dart';
//
// import '../../../../../../core/utils/app_colors.dart';
// import '../../../../../../core/utils/icons_image_pathes.dart';
//
// class SearchFieldSample extends StatefulWidget {
//   const SearchFieldSample({Key? key}) : super(key: key);
//
//   @override
//   State<SearchFieldSample> createState() => _SearchFieldSampleState();
// }
//
// class _SearchFieldSampleState extends State<SearchFieldSample> {
//   int suggestionsCount = 12;
//   final focus = FocusNode();
//
//   @override
//   void initState() {
//     suggestions = [
//       'United States',
//       'Germany',
//       'Washington',
//       'Paris',
//       'Jakarta',
//       'Australia',
//       'India',
//       'Czech Republic',
//       'Lorem Ipsum',
//       'Lorem Ipsum',
//       'Lorem Ipsum',
//       'Lorem Ipsum',
//       'Lorem Ipsum',
//       'Lorem Ipsum',
//       'United States',
//       'Germany',
//       'Washington',
//       'Paris',
//       'Jakarta',
//       'Australia',
//       'United States',
//       'Germany',
//       'Washington',
//       'Paris',
//       'Jakarta',
//       'Australia',
//     ];
//     super.initState();
//   }
//
//   final TextEditingController searchController = TextEditingController();
//   var suggestions = <String>[];
//   int counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             SearchField(
//               controller: searchController,
//               searchInputDecoration: InputDecoration(
//                   constraints: const BoxConstraints(
//                     maxHeight: 40,
//                     minHeight: 30,
//                     maxWidth: 90,
//                     minWidth: 80,
//                   ),
//                   contentPadding: const EdgeInsets.only(left: 8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.dg),
//                     borderSide: const BorderSide(
//                       color: AppColors.n40Gray,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.dg),
//                     borderSide: const BorderSide(
//                       color: AppColors.n40Gray,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4.dg),
//                     borderSide: const BorderSide(
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.only(left: 12, right: 5),
//                     child: SvgPicture.asset(
//                       width: 10,
//                       height: 10,
//                       colorFilter: const ColorFilter.mode(
//                         AppColors.primaryColor,
//                         BlendMode.srcIn,
//                       ),
//                       searchIcon,
//                     ),
//                   ),
//                   prefixIconConstraints: const BoxConstraints(
//                     minWidth: 45,
//                     minHeight: 45,
//                   ),
//                   suffixIconConstraints: const BoxConstraints(
//                     minWidth: 20,
//                     minHeight: 20,
//                   ),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: Container(
//                       height: 20,
//                       width: 20,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: AppColors.primaryColor,
//                           width: 1.5,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           searchController.clear();
//                         },
//                         child: const Icon(
//                           Icons.clear,
//                           size: 11,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                   )),
//               maxSuggestionsInViewPort: 30,
//               hint: 'Basic SearchField',
//               suggestions:
//                   suggestions.map(SearchFieldListItem<String>.new).toList(),
//               onScroll: (_, __) {
//                 SystemChannels.textInput.invokeMethod('TextInput.hide');
//               },
//               suggestionItemDecoration:
//                   SuggestionDecoration(borderRadius: BorderRadius.circular(16)
//                       // color: Colors.red
//                       ),
//               suggestionsDecoration: SuggestionDecoration(width: 300),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
