import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/food_store/provider/order_provider.dart';
import '../../service/local_storage/user_storage.dart';

class AddressBottomSheet {
  static void show(BuildContext context) {
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
                      onPressed: () {
                        final entered = addressController.text.trim();
                        if (entered.isNotEmpty) {
                          final authStorage = UserStorage();
                          authStorage.updateUserAddress(entered);
                          // Reload address in viewmodel
                          context.read<OrderProvider>().getUserAddress();
                          Navigator.pop(context);
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
