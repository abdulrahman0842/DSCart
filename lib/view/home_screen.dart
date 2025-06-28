import 'package:ds_cart/widgets/main_choice_card.dart';
import 'package:flutter/material.dart';

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
                Text(
                  "DS Cart",
                  style: TextStyle(
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                MainChoiceCard(
                  image: "food.jpg",
                  title: "DS Kitchens",
                  subTitle: "Enjoy delicious Cuisines",
                  nextScreen: Scaffold(
                    body: Center(child: Text("DS Kitches")),
                  ),
                ),
                MainChoiceCard(
                    image: "clothing.jpg",
                    title: "DS Fashions",
                    subTitle: "Try out our amazing new Fashions",
                    nextScreen: Scaffold(
                      body: Center(child: Text("DS Fashions")),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
