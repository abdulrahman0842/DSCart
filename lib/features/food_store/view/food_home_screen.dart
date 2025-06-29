import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      context.read<FoodProvider>().getAllFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Consumer<FoodProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return CircularProgressIndicator();
        }
        if (provider.foods.isEmpty || provider.isLoading == false) {
          return Text("No Data Available!");
        }
        return ListView.builder(
            itemCount: provider.foods.length,
            itemBuilder: (context, index) {
              final item = provider.foods[index];
              return ListTile(
                title: Text(item.name),
              );
            });
      })),
    );
  }
}
