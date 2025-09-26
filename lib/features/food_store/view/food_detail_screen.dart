import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:ds_cart/features/food_store/provider/cart_provider.dart';
import 'package:ds_cart/features/food_store/view/food_order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_elevated_icon_button.dart';
import '../../../core/widgets/custom_outlined_icon_button.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key, required this.food});
  final Food food;
  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ingredients = widget.food.ingredients;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        backgroundColor: const Color.fromARGB(255, 247, 225, 196),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          Hero(
            tag: widget.food.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                widget.food.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Food Name & Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.food.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹${widget.food.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Category
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Chip(
              label: Text(widget.food.category.toUpperCase()),
              backgroundColor: Colors.deepOrangeAccent.shade100,
            ),
          ),

          Divider(
            endIndent: 10,
            indent: 10,
            thickness: 1.5,
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              textAlign: TextAlign.justify,
              widget.food.description ?? "Unavailable",
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          // Ingredients
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...ingredients!.map(
            (ingredient) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "- $ingredient",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlinedIconButton(
                  label: provider.isInCart(widget.food)
                      ? "Remove from Cart"
                      : "Add to Cart",
                  icon: provider.isInCart(widget.food)
                      ? Icon(Icons.remove_shopping_cart_outlined)
                      : Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () {
                    provider.isInCart(widget.food)
                        ? context.read<CartProvider>().removeFromCart(
                            context, widget.food.id, widget.food.price)
                        : context
                            .read<CartProvider>()
                            .addToCart(context, widget.food);
                  },
                ),
                CustomElevatedIconButton(
                  label: "Order Now",
                  icon: Icon(Icons.shopping_cart_checkout),
                  onPressed: () async {
                    if (provider.isInCart(widget.food)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodOrderDetailScreen()));
                    } else {
                      await provider.addToCart(context, widget.food);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodOrderDetailScreen()));
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
