import 'package:ds_cart/features/food_store/view/food_cart_screen.dart';
import 'package:ds_cart/features/food_store/view/food_home_screen.dart';
import 'package:ds_cart/features/food_store/view/food_order_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  final List<Widget> screens = [
    FoodHomeScreen(),
    FoodOrderScreen(),
    Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: Center(child: Text("Profile")))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
          height: 60,
          backgroundColor: const Color.fromARGB(255, 247, 225, 196),
          indicatorColor: const Color.fromARGB(255, 248, 205, 148),
          elevation: 6,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(milliseconds: 300),
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedIndex: _currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
                icon: Icon(Icons.delivery_dining_rounded), label: "Order"),
            NavigationDestination(icon: Icon(Icons.person_2), label: "Account"),
          ]),
    );
  }
}
