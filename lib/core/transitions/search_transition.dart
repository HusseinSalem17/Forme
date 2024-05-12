import 'package:flutter/cupertino.dart';

class SearchTransition extends PageRouteBuilder {
  final Widget page;

  SearchTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1500),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.easeInOutCubicEmphasized,
              parent: animation,
              reverseCurve: Curves.fastOutSlowIn,
            );
            return Align(
              alignment: Alignment.bottomLeft,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
