import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/core/widgets/custom_elevated_button.dart';
import 'package:ds_cart/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
              "Welcome back",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "Access your account setting using email and password",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomTextField(
                controller: _emailController, hintText: "Enter Email"),
            CustomTextField(
                controller: _passwordController, hintText: "Enter Password"),
            Consumer<AuthProvider>(builder: (context, provider, _) {
              return CustomElevatedButton(
                child: provider.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Sing in",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                onPressed: () {
                  context.read<AuthProvider>().login(
                      context,
                      _emailController.text.trim(),
                      _passwordController.text.trim());
                },
              );
            }),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Don't Have an Account?\t Register Here")),
            )
          ],
        ),
      ),
    );
  }
}
