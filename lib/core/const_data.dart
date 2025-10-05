// const allFoodSampleData = {
//   "products": [
//     {
//       "_id": "685aeb765c633b0bc6fa335a1",
//       "name": "Caffe Mocha",
//       "category": "Drinks",
//       "price": 300,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a2",
//       "name": "Indian Cuisine",
//       "category": "main course",
//       "price": 500,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a3",
//       "name": "Latte",
//       "category": "beverage",
//       "price": 250,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a4",
//       "name": "Paneer Tikka",
//       "category": "starter",
//       "price": 400,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a5",
//       "name": "Espresso",
//       "category": "beverage",
//       "price": 200,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a6",
//       "name": "Veg Biryani",
//       "category": "main course",
//       "price": 350,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a7",
//       "name": "Cappuccino",
//       "category": "beverage",
//       "price": 280,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a8",
//       "name": "Pav Bhaji",
//       "category": "snack",
//       "price": 180,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335a9",
//       "name": "Iced Americano",
//       "category": "beverage",
//       "price": 270,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335b0",
//       "name": "Masala Dosa",
//       "category": "south indian",
//       "price": 220,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335b1",
//       "name": "Filter Coffee",
//       "category": "beverage",
//       "price": 150,
//       "imageURL": "assets/images/coffee.jpg",
//       "__v": 0
//     },
//     {
//       "_id": "685aeb765c633b0bc6fa335b2",
//       "name": "Chole Bhature",
//       "category": "north indian",
//       "price": 260,
//       "imageURL": "assets/images/food.jpg",
//       "__v": 0
//     }
//   ]
// };

const allFoodSampleData = {
  "products": [
    {
      "_id": "685aeb765c633b0bc6fa335a1",
      "name": "Caffe Mocha",
      "category": "drinks",
      "price": 300,
      "imageURL": "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg",
      "description":
          "A rich, chocolate-flavored coffee drink made with espresso, steamed milk, and topped with whipped cream.",
      "ingredients": [
        "Espresso",
        "Steamed milk",
        "Chocolate syrup",
        "Whipped cream",
        "Sugar"
      ],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a2",
      "name": "Indian Cuisine",
      "category": "lunchDinner",
      "price": 500,
      "imageURL": "https://images.pexels.com/photos/958546/pexels-photo-958546.jpeg",
      "description":
          "A wholesome Indian meal featuring curries, rice, and bread with authentic spices and flavors.",
      "ingredients": [
        "Basmati rice",
        "Paneer",
        "Mixed vegetables",
        "Indian spices",
        "Curry sauce",
        "Chapati/Naan"
      ],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a3",
      "name": "Latte",
      "category": "drinks",
      "price": 250,
      "imageURL": "https://images.pexels.com/photos/531639/pexels-photo-531639.jpeg",
      "description":
          "A smooth and creamy coffee drink made with fresh espresso and steamed milk.",
      "ingredients": ["Espresso", "Steamed milk", "Milk foam"],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a4",
      "name": "Paneer Tikka",
      "category": "snacks",
      "price": 400,
      "imageURL": "https://images.pexels.com/photos/3928854/pexels-photo-3928854.png",
      "description":
          "Grilled paneer cubes marinated in yogurt and spices, served with onions and bell peppers.",
      "ingredients": [
        "Paneer",
        "Yogurt",
        "Bell peppers",
        "Onions",
        "Spices",
        "Lemon juice"
      ],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a5",
      "name": "Espresso",
      "category": "drinks",
      "price": 200,
      "imageURL": "https://images.pexels.com/photos/3704460/pexels-photo-3704460.jpeg",
      "description":
          "A concentrated shot of coffee with a strong and bold flavor.",
      "ingredients": ["Freshly ground coffee beans", "Hot water"],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a6",
      "name": "Veg Biryani",
      "category": "lunchDinner",
      "price": 350,
      "imageURL": "https://images.pexels.com/photos/4439740/pexels-photo-4439740.jpeg",
      "description":
          "Aromatic basmati rice cooked with fresh vegetables, herbs, and flavorful spices.",
      "ingredients": [
        "Basmati rice",
        "Mixed vegetables",
        "Yogurt",
        "Onions",
        "Ginger-garlic paste",
        "Spices"
      ],
      "__v": 0
    },
    
    {
      "_id": "685aeb765c633b0bc6fa335a8",
      "name": "Pav Bhaji",
      "category": "snacks",
      "price": 180,
      "imageURL": "https://images.pexels.com/photos/5410400/pexels-photo-5410400.jpeg",
      "description":
          "A Mumbai street food favorite—spicy mashed vegetable curry served with butter-toasted bread rolls.",
      "ingredients": [
        "Potatoes",
        "Tomatoes",
        "Green peas",
        "Capsicum",
        "Onions",
        "Pav buns",
        "Butter",
        "Pav Bhaji masala"
      ],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335a9",
      "name": "Iced Americano",
      "category": "drinks",
      "price": 270,
      "imageURL": "https://images.pexels.com/photos/33617641/pexels-photo-33617641.jpeg",
      "description":
          "A refreshing cold coffee drink made by diluting espresso with chilled water and ice.",
      "ingredients": ["Espresso", "Cold water", "Ice cubes"],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335b0",
      "name": "Masala Dosa",
      "category": "breakfast",
      "price": 220,
      "imageURL": "https://images.pexels.com/photos/20422138/pexels-photo-20422138.jpeg",
      "description":
          "A South Indian classic—crispy rice crepe filled with a spiced potato mixture, served with chutney and sambar.",
      "ingredients": [
        "Rice batter",
        "Urad dal",
        "Potatoes",
        "Onions",
        "Green chilies",
        "Curry leaves",
        "Chutney",
        "Sambar"
      ],
      "__v": 0
    },
    {
      "_id": "685aeb765c633b0bc6fa335b2",
      "name": "Chole Bhature",
      "category": "lunchDinner",
      "price": 260,
      "imageURL": "https://images.pexels.com/photos/11818239/pexels-photo-11818239.jpeg",
      "description":
          "A popular North Indian dish—spiced chickpea curry served with fluffy deep-fried bread.",
      "ingredients": [
        "Chickpeas",
        "Onions",
        "Tomatoes",
        "Ginger-garlic paste",
        "Spices",
        "Flour",
        "Yogurt (for dough)"
      ],
      "__v": 0
    }
  ]
};
