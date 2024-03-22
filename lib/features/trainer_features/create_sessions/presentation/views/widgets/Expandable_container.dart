import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/create_sessions/presentation/views/widgets/f_time_range.dart';

class ExpandableContainerScreen extends StatelessWidget {
  const ExpandableContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List days = ['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ExpandableListView(title: '${days[index]}');
          },
          itemCount: days.length,
        ),
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;
  const ExpandableListView({super.key, required this.title});

  @override
  State<ExpandableListView> createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  List<String> sessions = [];
  bool onOffSwitch = false;
  onChanged(bool value) {
    value == false && expandFlag == true
        ? setState(() {
            onOffSwitch = value;
            expandFlag = !expandFlag;
          })
        : setState(() {
            onOffSwitch = value;
          });
  }

  static const BorderRadius _expandedBorderRadius = BorderRadius.all(
    Radius.circular(10),
  );

  static const BorderRadius _collapsedBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      margin: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: AppColors.n10Color,
              borderRadius: expandFlag ? _collapsedBorderRadius : _expandedBorderRadius,
              border: Border(
                left: BorderSide(
                  width: 4,
                  color: expandFlag ? AppColors.p300PrimaryColor.withOpacity(0.75) : AppColors.n100Color,
                ),
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.n100Color,
                  blurRadius: 2,
                  spreadRadius: 0.025,
                  offset: Offset(0, 0.2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CupertinoSwitch(
                    value: onOffSwitch,
                    onChanged: onChanged,
                    trackColor: AppColors.n40BorderColor,
                    activeColor: AppColors.p300PrimaryColor,
                  ),
                  IconButton(
                    icon: Icon(
                      expandFlag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                      color: onOffSwitch ? AppColors.n400color : AppColors.n40BorderColor,
                      size: 35.sp,
                    ),
                    onPressed: () {
                      onOffSwitch
                          ? setState(() {
                              expandFlag = !expandFlag;
                            })
                          : null;
                    },
                  ),
                ],
              ),
            ),
          ),
          ExpandableContainer(
            expanded: expandFlag,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical :8.0.h),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Set available Time', style: TextStyles.textStyleRegular.copyWith(color: AppColors.n400color)),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: AppColors.p300PrimaryColor,
                      ),
                      onPressed: () {
                        // Add a new session when the add icon is pressed
                        setState(() {
                          sessions.add('Session ${sessions.length + 1}');
                        });
                      },
                    ),
                  ),
              
                  // Display added sessions dynamically
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: const TimeRangePickerWidget(),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: AppColors.d300Danger,
                          ),
                          onPressed: () {
                            // Remove the corresponding session when the remove icon is pressed
                            setState(() {
                              sessions.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  const ExpandableContainer({
    super.key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 350,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? null : 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.n100Color,
              blurRadius: 2,
              spreadRadius: 0.025,
              offset: Offset(0, 0.2),
            ),
          ],
          color: AppColors.n20FillBodyInSmallCardColor,
          border: Border(
            left: BorderSide(
              width: 4,
              color: Colors.blue,
            ),
          ),
        ),
        child: Column(
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
