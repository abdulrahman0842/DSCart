import 'package:hive/hive.dart';

part 'food_model.g.dart';

class FoodModel {
  List<Food>? foods;

  FoodModel(this.foods);

  factory FoodModel.fromJson(List<Map<String, dynamic>> json) {
    List<Food> foods = json.map((item) => Food.fromJson(item)).toList();
    return FoodModel(foods);
  }
}

@HiveType(typeId: 0)
class Food extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String category;
  @HiveField(3)
  double price;
  @HiveField(4)
  String imageUrl;
  @HiveField(5)
  String? description;
  @HiveField(6)
  List<String>? ingredients;

  Food(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      this.description,
      this.ingredients});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        imageUrl: json["imageURL"],
        price: (json["price"] as num).toDouble(),
        description: json["description"],
        ingredients: json["ingredients"]);
  }
}
