import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/client_list/presentation/views/tabs/client_requests_tab.dart';
import 'package:forme_app/features/trainer_features/client_list/presentation/views/tabs/your_clients_tab.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});
  static const routeName = '/client_list_screen';

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            centerTitle: true,
            title: Text("Client List", style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.6.h, right: 8.w, left: 8.w),
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.n30StrokeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.fill,
                    labelColor: AppColors.n900PrimaryTextColor,
                    unselectedLabelColor: AppColors.n400color,
                    labelStyle: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp,
                    ),
                    enableFeedback: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Client Requests',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Your Clients',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ClientRequestsTab(),
                    YourClientsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
