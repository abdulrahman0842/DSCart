import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/provider/order_provider.dart';
import 'package:ds_cart/features/food_store/service/food_order_service.dart';
import 'package:ds_cart/features/food_store/service/mock_food_order_service.dart';
import 'package:ds_cart/features/food_store/service/mock_food_product_service.dart';
import 'package:ds_cart/provider/auth_provider.dart';
import 'package:ds_cart/service/auth_service.dart';
import 'package:ds_cart/service/mock_auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'features/food_store/provider/cart_provider.dart';
import 'view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(FoodAdapter());
  await Hive.openBox<Food>("foodCartBox");
  const bool isMock = kDebugMode;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) =>
            AuthProvider(isMock ? MockAuthService() : AuthService())),
    ChangeNotifierProvider(
        create: (_) => FoodProvider(MockFoodProductService())),
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) =>
          OrderProvider(isMock ? MockFoodOrderService() : FoodOrderService()),
    )
  ], child: MyApp()));
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
      home: SplashScreen(
      ),
    );
  }
}
