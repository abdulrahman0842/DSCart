import 'package:ds_cart/core/widgets/custom_text_field.dart';
import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  final _searchController = TextEditingController();

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
      body: SafeArea(
        child: Consumer<FoodProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return CircularProgressIndicator();
          }
          // if (provider.foods.isEmpty || provider.isLoading == false) {
          //   return Text("No Data Available!");
          // }
          return Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Need to try",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.foods.length,
                    itemBuilder: (context, index) {
                      final item = provider.foods[index];
                      return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toString()),
                          leading: Image.asset(item.imageUrl));
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
