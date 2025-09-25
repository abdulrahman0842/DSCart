import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
   const CustomAppbar(
      {super.key,
      required this.title,
      this.actions,
      this.autoImplyLeadingIcon});
  final String title;
  final bool? autoImplyLeadingIcon;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 247, 225, 196),
      automaticallyImplyLeading: autoImplyLeadingIcon??false,
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
