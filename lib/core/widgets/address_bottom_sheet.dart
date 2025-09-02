import 'package:flutter/material.dart';
import '../../service/local_storage/user_storage.dart';

class AddressBottomSheet {
  static void show(BuildContext context, Function() next) {
    final addressController = TextEditingController();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
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
                    child: ElevatedButton(
                      onPressed: () async {
                        final entered = addressController.text.trim();
                        if (entered.isNotEmpty) {
                          final userStorage = UserStorage();
                          await userStorage.updateUserAddress(entered);
                          next();
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text("Save Address"),
                    ),
                  ),
                ],
              ),
            ));
            
  }
}
