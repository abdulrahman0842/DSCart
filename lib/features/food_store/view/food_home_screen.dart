import 'package:ds_cart/core/widgets/address_bottom_sheet.dart';
import 'package:ds_cart/features/food_store/core/widgets/category_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/explore_item_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/special_item_card.dart';
import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/view/food_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/categories.dart';
import '../../../service/local_storage/user_storage.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  ValueNotifier<String?> address = ValueNotifier<String?>('');
  int _currentIndex = 0;
  List<Widget> pages = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Cart"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      getUserAddress();
      final provider = context.read<FoodProvider>();
      if (provider.foods.isEmpty) {
        provider.getAllFoods();
      }
    });
  }

  void getUserAddress() async {
    address.value = await UserStorage().getUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              _appBar(context),

              // Banner
              Image.asset("assets/images/food_home_banner.jpg"),

              // Categories List
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

              // Special For you Item
              Text("Special For You",
                  style: Theme.of(context).textTheme.titleLarge),
              SpecialItemCard(),

              // Explore Foods
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
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            NavigationDestination(
                icon: Icon(Icons.delivery_dining_rounded), label: "Order"),
            NavigationDestination(icon: Icon(Icons.person_2), label: "Account"),
          ]),
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery Address",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              ValueListenableBuilder(
                  valueListenable: address,
                  builder: (context, address, _) {
                    return GestureDetector(
                      onTap: () async {
                        AddressBottomSheet.show(context, getUserAddress);
                      },
                      child: Text(
                        address != null ? "📍 $address" : "Tap to Add Address",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  })
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (contetx) => FoodCartScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              weight: 18,
            )),
      ],
    );
  }
}
