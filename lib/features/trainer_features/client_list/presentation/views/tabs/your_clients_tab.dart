import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/client_list/data/your_client_model.dart';
import 'package:forme_app/features/trainer_features/client_list/presentation/views/widgets/your_clients_cards.dart';

class YourClientsTab extends StatelessWidget {
  const YourClientsTab({super.key});

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
                itemCount: yourClientsModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: YourClientsCard(
                      model: yourClientsModel[index],
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