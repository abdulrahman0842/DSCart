import 'package:ds_cart/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: "Profile",
        ),
        body: Center(child: Text("Profile")));
  }
}
