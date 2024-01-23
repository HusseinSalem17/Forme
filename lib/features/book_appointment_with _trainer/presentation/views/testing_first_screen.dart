import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar_arrow_button.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeBox = SizedBox(
      height: 16.h,
    );
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 70,
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                FlexibleSpaceBar(
                  background: Image.network(
                    'https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701968267.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 61,
                  bottom: -61,
                  child: Container(
                    height: 122,
                    width: 122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(61),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(61),
                        child: Image.asset(
                          'assets/image/m.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomAppBarArrowButton(
                onTap: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
