// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:forme_app/core/utils/app_colors.dart';
// import 'package:forme_app/core/utils/text_styles.dart';
// import 'package:time_range_picker/time_range_picker.dart';
//
//
// class TimeRangePickerWidget extends StatefulWidget {
//   const TimeRangePickerWidget({Key? key}) : super(key: key);
//
//   @override
//   State<TimeRangePickerWidget> createState() => _TimeRangePickerWidgetState();
// }
//
// class _TimeRangePickerWidgetState extends State<TimeRangePickerWidget> {
//   late TimeOfDay _startTime;
//   late TimeOfDay _endTime;
//   bool isSelected = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize start and end time
//     _startTime = TimeOfDay.now();
//     _endTime = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 3)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  GestureDetector(
//       onTap: () async {
//         await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               contentPadding: EdgeInsets.zero,
//               surfaceTintColor: Colors.transparent,
//               content: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: 420,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 100,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//                             color: AppColors.p300PrimaryColor,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "Start: ",
//                                       style: TextStyles.heading4Bold.copyWith(color: Colors.white),
//                                     ),
//                                     Text(
//                                       _startTime.format(context),
//                                       style: TextStyles.kDescriptionStyle.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text(
//                                       "End: ",
//                                       style: TextStyles.heading4Bold.copyWith(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Text(
//                                       _endTime.format(context),
//                                       style: TextStyles.kDescriptionStyle.copyWith(color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         TimeRangePicker(
//                           start: _startTime,
//                           end: _endTime,
//                           hideTimes: true,
//                           hideButtons: true,
//                           strokeWidth: 4,
//                           handlerRadius: 8,
//                           ticks: 24,
//                           ticksOffset: -8,
//                           ticksLength: -30,
//                           ticksColor: Colors.grey,
//                           strokeColor: Colors.blue,
//                           handlerColor: Colors.blue,
//                           snap: true,
//                           labels: ["12 am", "3 am", "6 am", "9 am", "12 pm", "3 pm", "6 pm", "9 pm"].asMap().entries.map((e) {
//                             return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
//                           }).toList(),
//                           labelOffset: 30,
//                           rotateLabels: false,
//                           padding: 60,
//                           onStartChange: (start) {
//                             setState(() {
//                               _startTime = start;
//                             });
//                           },
//                           onEndChange: (end) {
//                             setState(() {
//                               _endTime = end;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               actions: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       style: TextButton.styleFrom(
//                         foregroundColor: AppColors.p300PrimaryColor,
//                       ),
//                       child: Text(
//                         'cancel',
//                         style: TextStyles.kDescriptionStyle.copyWith(color: AppColors.p300PrimaryColor),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         setState(() {});
//                         Navigator.of(context).pop(TimeRange(startTime: _startTime, endTime: _endTime));
//                         isSelected = true;
//                       },
//                       style: TextButton.styleFrom(
//                         foregroundColor: AppColors.p300PrimaryColor,
//                       ),
//                       child: Text(
//                         'Done',
//                         style: TextStyles.kDescriptionStyle.copyWith(color: AppColors.p300PrimaryColor),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         );
//       },
//       child: Row(
//         children: [
//           Container(
//             width: 76.w,
//             height: 38.h,
//             decoration: BoxDecoration(
//               color: AppColors.background,
//               borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
//               border: Border.all(
//                 color: AppColors.n40BorderColor,
//               ),
//             ),
//             child: !isSelected
//                 ? Stack(
//                   children: [
//                     Positioned(
//                       bottom: 20.h,
//                         right: 40.w,
//                       child: Text(
//                           "From",
//                           textAlign: TextAlign.left,
//                           style: TextStyles.textStyleMedium.copyWith(color: AppColors.n200BodyContentColor, fontSize: 12),
//                         ),
//                     ),
//                   ],
//                 )
//                 : Stack(
//                     children: [
//                       Positioned(
//                         bottom: 22,
//                         right: 40.w,
//                         child: Text(
//                           "From",
//                           textAlign: TextAlign.left,
//                           style: TextStyles.textStyleMedium.copyWith(color: AppColors.n200BodyContentColor, fontSize: 12),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             _startTime.format(context),
//                             textAlign: TextAlign.left,
//                             style: TextStyles.textStyleMedium.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//           Container(
//             width: 76.w,
//             height: 38.h,
//             decoration: BoxDecoration(
//               color: AppColors.background,
//               borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
//               border: Border.all(
//                 color: AppColors.n40BorderColor,
//               ),
//             ),
//             child: !isSelected
//                 ? Stack(
//                   children: [
//                     Positioned(
//                         bottom: 20.h,
//                         right: 55.w,
//                       child: Text(
//                           "To",
//                           textAlign: TextAlign.left,
//                           style: TextStyles.textStyleMedium.copyWith(color: AppColors.n200BodyContentColor, fontSize: 12),
//                         ),
//                     ),
//                   ],
//                 )
//                 : Stack(
//                     children: [
//                       Positioned(
//                         bottom: 20.h,
//                         right: 55.w,
//                         child: Text(
//                           "To",
//                           textAlign: TextAlign.left,
//                           style: TextStyles.textStyleMedium.copyWith(color: AppColors.n200BodyContentColor, fontSize: 12),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             _endTime.format(context),
//                             textAlign: TextAlign.left,
//                             style: TextStyles.textStyleMedium.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
