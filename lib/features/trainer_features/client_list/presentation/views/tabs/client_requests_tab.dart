import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/client_list/data/client_requests_model.dart';
import 'package:forme_app/features/trainer_features/client_list/presentation/views/widgets/client_requests_card.dart';

class ClientRequestsTab extends StatelessWidget {
  const ClientRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(top:23.6),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: clientsRequestsModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ClientsRequestsCard(
                      model: clientsRequestsModel[index],
                      size: size,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}