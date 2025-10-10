import 'package:ds_cart/core/navigation_animation.dart';
import 'package:ds_cart/core/widgets/login_alert_dialog.dart';
import 'package:ds_cart/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

protectedRouteHelper(BuildContext context, Widget nextScreen) {
  final isLoggedIn = context.read<AuthProvider>().isLoggedIn;

  if (!isLoggedIn) {
    showLoginAlertDialog(context);
    return;
  }
  Navigator.push(context, NavigationAnimation.slidePageTransition(nextScreen));
}
