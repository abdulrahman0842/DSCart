import 'package:ds_cart/core/widgets/main_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/food_store/view/main_screen.dart';
import '../provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DS Cart",
                      style: TextStyle(
                          fontSize: 60,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          context.read<AuthProvider>().logout(context);
                        },
                        child: Text("Logout",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                MainChoiceCard(
                    image: "food.jpg",
                    title: "DS Kitchens",
                    subTitle: "Enjoy delicious Cuisines",
                    nextScreen: MainScreen()),
                MainChoiceCard(
                    image: "clothing.jpg",
                    title: "DS Fashions",
                    subTitle: "Try out our amazing new Fashions",
                    nextScreen: Scaffold(
                      body: Center(child: Text("DS Fashions")),
                    )),
                TextButton(
                    onPressed: () {
                      void showCustomToast(
                          BuildContext context, String message) {
                        final overlay = Overlay.of(context);
                        final overlayEntry = OverlayEntry(
                          builder: (context) => Positioned(
                            top: MediaQuery.of(context).size.height * 0.4,
                            left: 50,
                            right: 50,
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle,
                                        color: Colors.green, size: 24),
                                    SizedBox(width: 8),
                                    Text(message,
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        overlay.insert(overlayEntry);

                        Future.delayed(Duration(seconds: 3), () {
                          overlayEntry.remove();
                        });
                      }
                      showCustomToast(context,"Order Placed");
                    },
                    child: Text(
                      "Testing Screen",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
