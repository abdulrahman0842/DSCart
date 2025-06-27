import 'package:ds_cart/widgets/custom_elevated_button.dart';
import 'package:ds_cart/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DS Cart",
              style: TextStyle(
                  fontSize: 60,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomTextField(
              controller: _nameController,
              hintText: "Enter Name",
            ),
            CustomTextField(
                controller: _emailController, hintText: "Enter Email"),
            CustomTextField(
                controller: _passwordController, hintText: "Create Password"),
            CustomElevatedButton(
              label: "Register",
              onPressed: () {
                // Login Call here
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
            TextButton(
                onPressed: () {},
                child: Text("Already Have an Account?\t Login Here"))
          ],
        ),
      ),
    );
  }
}
