import 'package:ds_cart/core/widgets/custom_appbar.dart';
import 'package:ds_cart/features/food_store/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_elevated_icon_button.dart';
import 'food_order_detail_screen.dart';

class FoodCartScreen extends StatefulWidget {
  const FoodCartScreen({super.key});

  @override
  State<FoodCartScreen> createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CartProvider>();
      provider.getCartItems(context);
      provider.calculateCartTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Cart",
        autoImplyLeadingIcon: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 22),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<CartProvider>(builder: (context, provider, _) {
                  return Text(
                      textAlign: TextAlign.center,
                      "Cart Total\n${provider.cartTotal}");
                }),
                CustomElevatedIconButton(
                  label: "Order Now",
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    if (context.read<CartProvider>().cartItems.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "No items in Cart, add items before Ordering")));
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FoodOrderDetailScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<CartProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (provider.cartItems.isNotEmpty) {
          return ListView.builder(
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
                final item = provider.cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        provider.removeFromCart(context, item.id, item.price);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              });
        }
        return Center(child: Text("Cart is empty add some items!"));
      }),
    );
  }
}
