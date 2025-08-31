import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:ds_cart/features/food_store/view/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

class ExploreItemCardWidget extends StatelessWidget {
  const ExploreItemCardWidget({
    super.key,
    required this.foodItem,
  });

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetailScreen(food: foodItem)));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 12),
        elevation: 6,
        color: const Color.fromARGB(255, 247, 225, 196),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(spacing: 5, children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(foodItem.imageUrl))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodItem.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          foodItem.category,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Text(
                      "\$ ${foodItem.price}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 24, 128, 28)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "⭐ 4.5 Reviews (123)",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Consumer<CartProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return IconButton(
                            onPressed: () {
                              provider.isInCart(foodItem)
                                  ? provider.removeFromCart(
                                      context, foodItem.id, foodItem.price)
                                  : provider.addToCart(context, foodItem);
                            },
                            icon: Icon(
                              provider.isInCart(foodItem)
                                  ? Icons.favorite
                                  : Icons.favorite_border_sharp,
                              color: Colors.red,
                              size: 30,
                            ));
                      },
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
