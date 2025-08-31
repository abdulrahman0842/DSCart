import 'package:ds_cart/features/food_store/view/categorywise_food_screen.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.category,
    required this.imgUrl,
  });
  final String category;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategorywiseFoodScreen(category: category)));
      },
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.height * 0.18,
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              imgUrl == 'NULL'
                  ? Placeholder()
                  : Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
              Container(
                color: Colors.black26,
              ),
              Center(
                child: Text(
                  category,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Consumer<FoodProvider>(builder: (context, provider, _) {
//           if (provider.isLoading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           // if (provider.foods.isEmpty || provider.isLoading == false) {
//           //   return Text("No Data Available!");
//           // }
//           return ListView.builder(
//               padding: EdgeInsets.all(15),
//               shrinkWrap: true,
//               itemCount: provider.foods.length,
//               itemBuilder: (context, index) {
//                 final item = provider.foods[index];
//                 return Card(
//                   elevation: 8,
//                   margin: EdgeInsets.symmetric(vertical: 4),
//                   child: ListTile(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => FoodDetailScreen(
//                                       food: item,
//                                     )));
//                       },
//                       title: Text(item.name),
//                       subtitle: Text(item.price.toString()),
//                       leading: SizedBox(
//                         height: 75,
//                         width: 75,
//                         child: Image.asset(item.imageUrl),
//                       )),
//                 );
//               });
//         }),
