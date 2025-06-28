import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/widgets/custom_elevated_button.dart';
import 'package:ds_cart/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.left,
              "Register Now",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "Sign up with your email and passsword to continue",
              style: TextStyle(fontSize: 20, color: Colors.grey),
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
            Consumer<AuthProvider>(builder: (context, provider, _) {
              return CustomElevatedButton(
                child: provider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                onPressed: () {
                  context.read<AuthProvider>().register(
                      context,
                      _nameController.text.trim(),
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                },
              );
            }),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text("Already Have an Account?\t Login Here")),
            )
          ],
        ),
      ),
    );
  }
}
