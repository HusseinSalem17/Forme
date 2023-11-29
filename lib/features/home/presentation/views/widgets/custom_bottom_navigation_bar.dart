import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:forme_app/core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/Icon/home.svg',
            height: 20.h,
            width: 20.w,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/Icon/pin-map.svg',
            height: 20.h,
            width: 20.w,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/Icon/heart.svg',
            height: 20.h,
            width: 20.w,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/Icon/chat.svg',
            height: 20.h,
            width: 20.w,
          ),
          label: 'chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/Icon/profile.svg',
            height: 20.h,
            width: 20.w,
          ),
          label: 'Profile',
        ),
      ],
      //currentIndex: BlocProvider.of<HomeBloc>(context).currentIndex,
      onTap: (index) {
        setState(() {
          //BlocProvider.of<HomeBloc>(context).getCurrentIndex(index);
        });
      },
      //fixedColor: AssetsColors.kSecondaryColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.n80NavColor,
      showUnselectedLabels: true,
    );
  }
}
