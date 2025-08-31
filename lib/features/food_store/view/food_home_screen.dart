import 'package:ds_cart/features/food_store/core/widgets/category_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/explore_item_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/special_item_card.dart';
import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/view/food_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/categories.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = context.read<FoodProvider>();
      if (provider.foods.isEmpty) {
        provider.getAllFoods();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Address",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          "📍 123, Baker Streets, Malegaon Central",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 28,
                        weight: 18,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        size: 28,
                        weight: 18,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contetx) => FoodCartScreen()));
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                        weight: 18,
                      )),
                ],
              ),
              Image.asset("assets/images/food_home_banner.jpg"),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryCardWidget(
                          category: category["category"] ?? "NULL",
                          imgUrl: category["img"] ?? "NULL",
                        ),
                      );
                    }),
              ),
              Text("Special For You",
                  style: Theme.of(context).textTheme.titleLarge),
              SpecialItemCard(),
              Text("Explore", style: Theme.of(context).textTheme.titleLarge),
              Consumer<FoodProvider>(builder: (context, provider, _) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                var foodItems = provider.foods;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    var food = foodItems[index];
                    return ExploreItemCardWidget(
                      foodItem: food,
                    );
                  },
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
