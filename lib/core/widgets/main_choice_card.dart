import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainChoiceCard extends StatelessWidget {
  const MainChoiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.nextScreen,
  });
  final String image;
  final String title;
  final String subTitle;
  final Widget nextScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    nextScreen,
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                            .animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                }));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          child: Stack(fit: StackFit.expand, children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              fadeInCurve: Curves.easeInOut,
              fadeInDuration: Duration(milliseconds: 500),
              placeholderFadeInDuration: Duration(milliseconds: 100),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.black38,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  textAlign: TextAlign.center,
                  subTitle,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade100,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
