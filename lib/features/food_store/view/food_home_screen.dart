import 'package:ds_cart/core/widgets/address_bottom_sheet.dart';
import 'package:ds_cart/features/food_store/core/widgets/category_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/explore_item_card_widget.dart';
import 'package:ds_cart/features/food_store/core/widgets/special_item_card.dart';
import 'package:ds_cart/features/food_store/provider/food_provider.dart';
import 'package:ds_cart/features/food_store/view/food_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/navigation_animation.dart';
import '../../../provider/user_provider.dart';
import '../core/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().getAddress();
      final provider = context.read<FoodProvider>();
      if (provider.foods.isEmpty) {
        provider.getAllFoods();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            _appBar(context),

            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 0.9,
                  // enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOut),
              items: [
                Image.asset("assets/images/food_home_banner.jpg"),
              ],
            ),
            // Banner
            // Image.asset("assets/images/food_home_banner.jpg"),

            // Categories List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Special For You",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SpecialItemCard(),
            ),

            // Explore Foods
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Explore",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Consumer<FoodProvider>(builder: (context, provider, _) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              var foodItems = provider.foods;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      )),
    );
  }

  Widget _appBar(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
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
                GestureDetector(
                  onTap: () async {
                    final newAddress = await AddressBottomSheet.show(context);
                    if (newAddress != null && newAddress.isNotEmpty) {
                      userProvider.saveAddress(newAddress);
                      return;
                    }
                  },
                  child: Text(
                    userProvider.address != null
                        ? "📍 ${userProvider.address}"
                        : "Tap to Add Address",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28,
                    weight: 18,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        NavigationAnimation.slidePageTransition(
                            FoodCartScreen()));
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                    weight: 18,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
