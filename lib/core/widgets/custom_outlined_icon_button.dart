import 'package:flutter/material.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  const CustomOutlinedIconButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});
  final String label;
  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: OutlinedButton.styleFrom(
          elevation: 8,
          side: BorderSide(color: Theme.of(context).primaryColor),
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
