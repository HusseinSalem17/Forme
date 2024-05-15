import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/help_center/contact_us.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/help_center/f_a_q.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/widgets/search_text_field.dart';

class HelpCenter extends StatefulWidget {
  static const routeName = '/help-center-screen';

  final List<String> filterTypes;
  const HelpCenter({super.key, required this.filterTypes});

  @override
  State<HelpCenter> createState() => _HelpCenterState(filterTypes);
}

class _HelpCenterState extends State<HelpCenter> {
  List<String> filterTypes;
  _HelpCenterState(this.filterTypes);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: AppColors.background,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.sizeOf(context).height / 4.5,
                  actions: [
                    CustomAppBarArrowButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    Text(
                      'Help Center',
                      style: TextStyles.textStyleBold.copyWith(
                          fontSize: 18.sp, color: AppColors.n900Black),
                    ),
                    const Spacer(),
                    SizedBox(width: 32.w),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                      background: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: const Center(child: SearchTextField()),
                      )),
                  bottom: PreferredSize(
                    preferredSize:
                        Size.fromHeight(MediaQuery.sizeOf(context).height / 20),
                    child: Container(
                      width: double.maxFinite,
                      color: AppColors.background,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: const CustomTabBar(
                          titles: ['FAQ', 'Contact Us'],
                        ),
                      ),
                    ),
                  )),
            ];
          },
          body: TabBarView(
            children: [
              FAQsTab(filterTypes: filterTypes),
              ContactUsTab(filterTypes: filterTypes)
            ],
          ),
        ),
      ),
    );
  }
}
