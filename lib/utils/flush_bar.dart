import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBar {
  static success(String mdg, BuildContext context) {
    showFlushbar(context: context, flushbar: Flushbar());
  }
}
