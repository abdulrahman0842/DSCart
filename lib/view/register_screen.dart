import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/core/widgets/custom_elevated_button.dart';
import 'package:ds_cart/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/form_validators.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Consumer<AuthProvider>(
                    builder: (context, provider, _) {
                      return provider.errorMessage != null
                          ? Text(
                              style: TextStyle(color: Colors.red, fontSize: 16),
                              provider.errorMessage ?? "Something Went Wrong")
                          : Container();
                    },
                  ),
                  CustomTextField(
                    validator: (value) {
                      return FormValidators.requiredField(value);
                    },
                    controller: _nameController,
                    hintText: "Enter Name",
                  ),
                  CustomTextField(
                    validator: (value) {
                      return FormValidators.email(value);
                    },
                    controller: _emailController,
                    hintText: "Enter Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    validator: (value) {
                      return FormValidators.mobile(value);
                    },
                    controller: _mobileController,
                    hintText: "Enter mobile Number",
                    textInputType: TextInputType.phone,
                  ),
                  CustomTextField(
                      validator: (value) {
                        return FormValidators.password(value);
                      },
                      textInputType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      hintText: "Create Password"),
                  CustomTextField(
                      validator: (value) {
                        return FormValidators.requiredField(value);
                      },
                      controller: _addressController,
                      textInputType: TextInputType.streetAddress,
                      hintText: "Enter your address"),
                  Consumer<AuthProvider>(builder: (context, provider, _) {
                    return provider.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomElevatedButton(
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                provider.register(
                                  context,
                                  _nameController.text,
                                  _emailController.text,
                                  _mobileController.text,
                                  _passwordController.text,
                                  _addressController.text,
                                );
                              }
                            },
                          );
                  }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Already Have an Account?\t Login Here")),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      icon: Icon(Icons.home))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
