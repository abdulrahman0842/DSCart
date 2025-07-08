import 'package:ds_cart/core/widgets/address_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/food_model.dart';
import '../provider/cart_provider.dart';
import '../provider/order_provider.dart';

class FoodOrderScreen extends StatefulWidget {
  final List<Food> foodItems;
  final double totalAmount;

  const FoodOrderScreen({
    super.key,
    required this.foodItems,
    required this.totalAmount,
  });

  @override
  State<FoodOrderScreen> createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final orderProvider = context.read<OrderProvider>();
      await orderProvider.getUserAddress();
      if (orderProvider.address == null) {
        AddressBottomSheet.show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Address section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
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
                  Expanded(child: Consumer<OrderProvider>(
                    builder: (context, provider, _) {
                      return Text(
                        provider.address ?? "NOT Found",
                        style: const TextStyle(fontSize: 16),
                      );
                    },
                  )),
                  IconButton(
                      onPressed: () {
                        AddressBottomSheet.show(context);
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Order items list
            Expanded(
              child: ListView.separated(
                itemCount: widget.foodItems.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = widget.foodItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Quantity: 1"),
                    trailing: Text("₹${(item.price * 1).toStringAsFixed(2)}"),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Total amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${widget.totalAmount.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Place order button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final orderProvider = context.read<OrderProvider>();
                  await orderProvider.placeOrder(
                      widget.foodItems, widget.totalAmount);
                  if (orderProvider.isOrderPlaced) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Order placed successfully")),
                    );
                    await Future.delayed(Duration(seconds: 2), () {
                      context.read<CartProvider>().emptyCart();
                      Navigator.pop(context);
                    });
                  }
                },
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
