import 'package:flutter/material.dart';

class PageRouteAnimation extends PageRouteBuilder {
  final Widget route;

  PageRouteAnimation(this.route)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => route,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final begin = Offset(0.0, 1.0);
              final end = Offset.zero;
              final curve = Curves.easeInOut;
              final tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}

class PageRouteAnimation2 extends PageRouteBuilder {
  final Widget route;

  PageRouteAnimation2(this.route)
      : super(
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) => route,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            });
}
