import 'package:flutter/material.dart';

class NavigationAnimation {

  static PageRouteBuilder<dynamic> slidePageTransition(Widget nextScreen) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        });
  }
}