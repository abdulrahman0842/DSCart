import 'package:ds_cart/core/form_validators.dart';
import 'package:ds_cart/core/widgets/custom_elevated_button.dart';
import 'package:ds_cart/core/widgets/custom_text_field.dart';
import 'package:ds_cart/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            CustomTextField(
                controller: _otpController,
                hintText: "Enter OTP",
                textInputType: TextInputType.number,
                validator: (value) {
                  return FormValidators.requiredField(value);
                }),
            Consumer<AuthProvider>(
              builder: (context, provider, _) {
                return CustomElevatedButton(
                    child: provider.isLoading
                        ? CircularProgressIndicator()
                        : Text("Verify OTP"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        provider.verifyOtp(context, provider.user?.email??"",
                            _otpController.text);
                      }
                    });
              },
            )
          ],
        ),
      )),
    ));
  }
}
