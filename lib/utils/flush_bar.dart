import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBar {
  static success(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(12),
          flushbarStyle: FlushbarStyle.FLOATING,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          icon: Icon(
            Icons.check_circle_outlined,
            color: Colors.white,
          ),
        )..show(context));
  }

  static neutral(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          backgroundColor: const Color(0xFFffc107),
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(12),
          messageColor: const Color(0xFF212529),
          flushbarStyle: FlushbarStyle.FLOATING,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
        )..show(context));
  }

  static removed(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          backgroundColor: const Color.fromARGB(255, 204, 195, 167),
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(12),
          messageColor: const Color(0xFF212529),
          flushbarStyle: FlushbarStyle.FLOATING,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
        )..show(context));
  }
}
