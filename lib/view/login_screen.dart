import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/core/widgets/custom_elevated_button.dart';
import 'package:ds_cart/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/form_validators.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              validator: (value) {
                return FormValidators.email(value);
              },
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              hintText: "Enter Email"),
          CustomTextField(
              validator: (value) {
                return FormValidators.requiredField(value);
              },
              controller: _passwordController,
              hintText: "Enter Password"),
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
                if (_formKey.currentState!.validate()) {
                  provider.login(context, _emailController.text.trim(),
                      _passwordController.text.trim());
                }
              },
            );
          }),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>RegisterScreen()));
                },
                child: Text("Don't Have an Account?\t Register Here")),
          )
        ],
      ),
    );
  }
}
