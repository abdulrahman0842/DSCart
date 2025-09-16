import 'package:ds_cart/features/food_store/core/widgets/explore_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../provider/food_provider.dart';

class CategorywiseFoodScreen extends StatefulWidget {
  const CategorywiseFoodScreen({super.key, required this.category});

  final String category;

  @override
  State<CategorywiseFoodScreen> createState() => _CategorywiseFoodScreenState();
}

class _CategorywiseFoodScreenState extends State<CategorywiseFoodScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FoodProvider>();
      provider.getFoodByCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: widget.category),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Consumer<FoodProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (provider.filteredFoods.isNotEmpty) {
            return ListView.builder(
                itemCount: provider.filteredFoods.length,
                itemBuilder: (context, index) {
                  var foodItem = provider.filteredFoods[index];
                  return ExploreItemCardWidget(foodItem: foodItem);
                });
          }
          return Center(
            child: Text("No ${widget.category} Available"),
          );
        }),
      ),
    );
  }
}
