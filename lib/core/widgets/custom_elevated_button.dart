import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
  });
  final Widget child;
  final Function() onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              backgroundColor: backgroundColor ?? const Color.fromARGB(255, 172, 67, 6),
              foregroundColor: Colors.white,
              iconColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: child),
    );
  }
}
