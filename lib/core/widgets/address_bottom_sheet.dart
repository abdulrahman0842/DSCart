import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class AddressBottomSheet {
  static Future<String?> show(BuildContext context) async {
    final addressController = TextEditingController();
    final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddressBottomSheetWidget(addressController: addressController);
        });

    return result;
  }
}

class AddressBottomSheetWidget extends StatelessWidget {
  const AddressBottomSheetWidget({
    super.key,
    required this.addressController,
  });

  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Enter your address", style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: "Address",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                child: Text("Save"),
                onPressed: () async {
                  final address = addressController.text.trim();
                  if (address.isNotEmpty) {
                    if (context.mounted) {
                      Navigator.pop(context, address);
                    }
                  }
                },
              )),
        ],
      ),
    );
  }
}
