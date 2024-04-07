import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/Trainer_Notification/data/trainer_notification_items.dart';
import 'package:forme_app/features/user_features/Notification/presentation/views/widgets/svg_icon.dart';


class TrainerNotificationScreenBody extends StatefulWidget {
  const TrainerNotificationScreenBody({super.key});

  @override
  _TrainerNotificationScreenBodyState createState() => _TrainerNotificationScreenBodyState();
}

class _TrainerNotificationScreenBodyState extends State<TrainerNotificationScreenBody> {
  List<TrainerNotificationItem> items1 = [
    TrainerNotificationItem("Group", "Tutor Appointment Booked", "1h", "Lorem ipsum dolor sit amet consectetur."),
    TrainerNotificationItem("Schedulecalender", "30% Discount Gym", "1h", "Lorem ipsum dolor sit amet consectetur. Sed eget odio hac scelerisque"),
    TrainerNotificationItem("Group", "Tutor Appointment Booked", "1h", "Lorem ipsum dolor sit amet consectetur. lectus posuere at scelerisque.")
  ];
  List<TrainerNotificationItem> items2 = [
    TrainerNotificationItem("Group", "Gym", "1d", "Lorem ipsum dolor sit amet consectetur. lectlamcorper ac egestas mi."),
    TrainerNotificationItem("Schedulecalender", "Tutor Appointment Booked", "1d", "Description 2"),
    TrainerNotificationItem("Icons.local_offer", "60% Discount Gym", "1d", "Description 3"),
  ];
  List<TrainerNotificationItem> items3 = [
    TrainerNotificationItem("Group", "Tines", "2d", "Description 1"),
    TrainerNotificationItem("Schedulecalender", "Football 2", "2d", "Description 2"),
    TrainerNotificationItem("Group", "Tutor Appointment Booked 3", "2d", "Description 3"),
  ];

  int unreadNotification = 0;
  bool markAllAsRead = false;

  @override
  Widget build(BuildContext context) {
    unreadNotification = items1.where((item) => item.isUnread).length + items2.where((item) => item.isUnread).length + items3.where((item) => item.isUnread).length;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomAppBarArrowButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          "Notification",
          style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black),
        ),
        actions: [
          Visibility(
            visible: unreadNotification > 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 30.h,
                width: 66.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  "$unreadNotification New",
                  style: TextStyles.heading4Bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSection("TODAY", items1),
            buildSection("YESTERDAY", items2),
            buildSection("14/12/2023", items3),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<TrainerNotificationItem> sectionItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n200BodyContentColor)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    markAllAsRead = true;
                    unreadNotification = 0;
                    for (var sectionItems in [items1, items2, items3]) {
                      unreadNotification -= sectionItems.where((item) => item.isUnread).length;
                      for (var item in sectionItems) {
                        item.isUnread = false;
                      }
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: title == "TODAY"
                    ? Text(
                        "Mark all as read",
                        style: TextStyle(
                          color: markAllAsRead ? AppColors.n100Gray : AppColors.primaryColor,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sectionItems.length,
          itemBuilder: (context, index) => buildNotificationItem(sectionItems[index]),
        ),
      ],
    );
  }

  Widget buildNotificationItem(TrainerNotificationItem item) {
    return Column(
      children: [
        ListTile(
          leading: SvgIcon(iconName: item.icon),
          title: Text(
            item.title,
            style: TextStyles.textStyleSemiBold.copyWith(color: Colors.black),
          ),
          subtitle: Text(
            item.description,
            style: TextStyles.descriptionStyle.copyWith(color: item.isUnread ? AppColors.primaryColor : AppColors.n100Gray),
          ),
          trailing: Text(
            item.time,
            style: TextStyles.descriptionStyle.copyWith(color: item.isUnread ? AppColors.primaryColor : AppColors.n100Gray),
          ),
          onTap: () {
            // Handle item click to mark as read
            setState(() {
              if (item.isUnread) {
                item.isUnread = false;
              }
            });
            debugPrint("Clicked: ${item.title}");
          },
        ),
        const Divider(),
      ],
    );
  }
}
