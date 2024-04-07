import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/subscriptions/data/your_clubs_cards_model.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/widgets/remove_from_clubs_section.dart';

class YourClubsCards extends StatefulWidget {
  const YourClubsCards({super.key, required this.size, required this.model, this.isRemoved = false});
  final Size size;
  final YourClubsCardsModel model;
  final bool isRemoved;

  @override
  State<YourClubsCards> createState() => _YourClubsCardsState();
}

class _YourClubsCardsState extends State<YourClubsCards> {
  bool isTabbed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: widget.size.width,
      height: widget.size.height / 8,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: AppColors.n50dropShadowColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 1,
          ),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  height: widget.size.height / 4,
                  width: widget.size.width / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/image/workout_image.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyles.textStyleSemiBold.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.n900Black,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/image/Icon/pin-map.svg'),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              widget.model.address,
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.n100Gray,
                                fontSize: 11.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/image/People.svg'),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  'Yous Clients: ',
                                  style: TextStyles.textStyleRegular.copyWith(
                                    color: AppColors.n100Gray,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Text(
                                  '${widget.model.numClients} Clients',
                                  style: TextStyles.textStyleBold.copyWith(
                                    color: AppColors.p200PrimaryColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            !widget.isRemoved?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: AppColors.d300Danger,
                    size: 35.sp,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.background.withOpacity(1),
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Remove From Favorites?',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.blackCardTextStyle.copyWith(fontSize: 16),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: AppColors.n30StrokeColor,
                                ),
                              ),
                              RemoveFromCardSection(size: widget.size, model: yourClubsCardsModel[widget.model.id]),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.n20FillBodyInSmallCardColor,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyles.textStyleSemiBold.copyWith(
                                              fontSize: 12,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.d300Danger,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              isTabbed = true;
                                            });
                                          },
                                          child: Text(
                                            'Yes, Remove',
                                            style: TextStyles.textStyleSemiBold.copyWith(
                                              fontSize: 12,
                                              color: AppColors.background,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}
