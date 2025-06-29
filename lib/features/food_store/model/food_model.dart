class FoodModel {
  List<Food>? foods;

  FoodModel(this.foods);

  FoodModel.fromJson(Map<String, dynamic> json) {
    if (json["products"] != null) {
      foods = <Food>[];
      json["products"].forEach((obj) {
        foods!.add(Food.fromJson(obj));
      });
    }
  }
}

class Food {
  String id;
  String name;
  String category;
  double price;
  String imageUrl;
  String? description;
  String? ingredients;

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
