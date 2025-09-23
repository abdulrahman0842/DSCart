import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SpecialItemCard extends StatelessWidget {
  const SpecialItemCard({
    super.key,
  });
  final String imgUrl =
      "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHwwfDB8fHww";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          imgUrl,
                        ))),
              ),
              Container(color: Colors.black26),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pepperoni Pizza",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              "Italian",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade100),
                            )
                          ],
                        ),
                        Text(
                          "\$ 9.9",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      "Pepperoni pizza is an American pizza variety which includes one of the country's most beloved toppings. Pepperoni is actually a corrupted form of peperoni (one “p”), which denotes a large pepper in Italian, but nowadays it denotes a spicy salami, usually made with a mixture of beef, pork, and spices.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
