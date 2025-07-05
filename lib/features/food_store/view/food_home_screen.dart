import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/view/food_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'food_detail_screen.dart';

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
      appBar: AppBar(
        title: Text("DS Kitchens"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FoodCartScreen()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<FoodProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // if (provider.foods.isEmpty || provider.isLoading == false) {
          //   return Text("No Data Available!");
          // }
          return ListView.builder(
              padding: EdgeInsets.all(15),
              shrinkWrap: true,
              itemCount: provider.foods.length,
              itemBuilder: (context, index) {
                final item = provider.foods[index];
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FoodDetailScreen(
                                      food: item,
                                    )));
                      },
                      title: Text(item.name),
                      subtitle: Text(item.price.toString()),
                      leading: SizedBox(
                        height: 75,
                        width: 75,
                        child: Image.asset(item.imageUrl),
                      )),
                );
              });
        }),
      ),
    );
  }
}
