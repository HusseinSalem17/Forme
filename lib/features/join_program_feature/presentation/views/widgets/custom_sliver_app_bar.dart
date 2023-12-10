import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar_arrow_button.dart';

class CustomSliverAppBar extends StatefulWidget {
  final ScrollController scrollController;

  const CustomSliverAppBar({
    super.key,
    required this.scrollController,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        _scrollOffset = widget.scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 70,
      elevation: 0,
      backgroundColor: Colors.white,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Opacity(
          opacity: (1.0 - _scrollOffset / 300.0).clamp(0.0, 1.0),
          child: Image.network(
            'https://pickywallpapers.com/img/2018/3/thumb/girl-gym-computer-background-893-912-hd-wallpapers-thumb.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomAppBarArrowButton(
          onTap: () {},
        ),
      ),
      actions: [
        CustomAppBarArrowButton(
          onTap: () {},
          icon: Icons.share_rounded,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: CustomAppBarArrowButton(
            onTap: () {},
            icon: Icons.favorite_border,
          ),
        ),
      ],
    );
  }
}