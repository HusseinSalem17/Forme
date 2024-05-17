import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/text_styles.dart';

class CustomGestureDetectorRow extends StatefulWidget {
  const CustomGestureDetectorRow(
      {super.key,
      required this.title,
      required this.imageAddress,
      required this.onTap});
  final String title;
  final String imageAddress;
  final Function()? onTap;

  @override
  State<CustomGestureDetectorRow> createState() =>
      _CustomGestureDetectorRowState();
}

class _CustomGestureDetectorRowState extends State<CustomGestureDetectorRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(widget.imageAddress),
              SizedBox(
                width: 8.w,
              ),
              Text(
                widget.title,
                style: TextStyles.textStyleRegular
                    .copyWith(color: Colors.black, fontSize: 16.sp),
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onTap,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
