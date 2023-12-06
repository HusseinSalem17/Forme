import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/success_story.dart';

class TrainerStorysScreen extends StatelessWidget {
  const TrainerStorysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.h),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.of(context)
                    .push(PageSlideTransition(const SuccessStory()));
          },
            child: Image.asset('assets/image/temp/image$index.png')),
      ),
    );
    // SliverGrid(
    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200.0,
    //     mainAxisSpacing: 10.0,
    //     crossAxisSpacing: 10.0,
    //     childAspectRatio: 4.0,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return Container(
    //         alignment: Alignment.center,
    //         color: Colors.teal[100 * (index % 9)],
    //         child: Text('grid item $index'),
    //       );
    //     },
    //     childCount: 20,
    //   ),
    // );
  }
}
