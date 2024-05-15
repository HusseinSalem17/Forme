import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/subscriptions/data/clients_subscriptions_cards_model.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/widgets/clients_subscriptions_card.dart';

class ClientsSubscriptionsScreen extends StatelessWidget {
  const ClientsSubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Clients Subscriptions',
            style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: clientsSubscriptionsCardsModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 21.w, right: 27.w),
                    child: ClientsSubscriptionsCard(
                      model: clientsSubscriptionsCardsModel[index],
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
