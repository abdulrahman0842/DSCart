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
        Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.7,
                    image: AssetImage('assets/images/$image')),
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
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
            )),
      ),
    );
  }
}
