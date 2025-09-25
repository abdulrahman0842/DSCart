import 'package:ds_cart/core/widgets/address_bottom_sheet.dart';
import 'package:ds_cart/core/widgets/custom_appbar.dart';
import 'package:ds_cart/utils/flush_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../provider/user_provider.dart';
import '../model/food_model.dart';
import '../provider/cart_provider.dart';
import '../provider/order_provider.dart';

class FoodOrderDetailScreen extends StatefulWidget {
  const FoodOrderDetailScreen({
    super.key,
  });

  @override
  State<FoodOrderDetailScreen> createState() => _FoodOrderDetailScreenState();
}

class _FoodOrderDetailScreenState extends State<FoodOrderDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _checkAddress();
     
    });
  }

  Future<void> _checkAddress() async {
    final userProvider = context.read<UserProvider>();
    await userProvider.getAddress();

    if (context.mounted) {
      if (userProvider.address == null || userProvider.address!.isEmpty) {
        String? newAddress = await AddressBottomSheet.show(context);
        if (newAddress == null || newAddress.isEmpty) {
          Navigator.pop(context);
          return;
        } else {
          await userProvider.saveAddress(newAddress);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<Food> cartItems = cartProvider.cartItems;
    double totalAmount = cartProvider.cartTotal;
    double grossTotal = totalAmount + 30;

    return Scaffold(
      appBar: CustomAppbar(
        title: "Your Order",
        autoImplyLeadingIcon: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 6),
        child: Column(
          children: [
            // Address bar
            showAddressBar(context),
            const SizedBox(height: 10),

            // Order items list
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Quantity: 1"),
                    trailing: Text(
                      "₹${(item.price * 1).toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Total amount
            Column(
              spacing: 5,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery Charge:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹30.0",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gross Total:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${grossTotal.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Place order button
            CustomElevatedButton(
              backgroundColor: const Color(0xFF4CAF50),
              child: const Text("Place Order"),
              onPressed: () async {
                final orderProvider = context.read<OrderProvider>();
                await orderProvider.placeOrder(cartItems, totalAmount);
                if (orderProvider.isOrderPlaced) {
                  FlushBar.success("Order Placed Successfully!", context);
                  await Future.delayed(Duration(seconds: 2), () {
                    context.read<CartProvider>().emptyCart();
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }

  // Address Bar
  Container showAddressBar(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(
              child: Text(
            userProvider.address ?? "Loading...",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          )),
          IconButton(
              onPressed: () async {
                final newAddress = await AddressBottomSheet.show(
                  context,
                );
                if (newAddress != null && newAddress.isNotEmpty) {
                  await userProvider.saveAddress(newAddress);
                  return;
                }
              },
              icon: Icon(Icons.edit))
        ],
      ),
    );
  }
}
