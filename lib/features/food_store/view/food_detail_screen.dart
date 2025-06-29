
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/food_provider.dart';



class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key, required this.foodId});
  final String foodId;
  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  
  
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<FoodProvider>().getFoodById(widget.foodId);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}