import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/service/mock_food_product_service.dart';
import 'package:ds_cart/features/food_store/view/food_home_screen.dart';
import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/service/auth_service.dart';
import 'package:ds_cart/service/mock_auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/splash_screen.dart';

void main() {
  const bool isMock = kDebugMode;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) =>
            AuthProvider(isMock ? MockAuthService() : AuthService())),
    ChangeNotifierProvider(
        create: (_) => FoodProvider(MockFoodProductService()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DS Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const FoodHomeScreen(),
    );
  }
}
