class User {
  final String name;
  final String email;
  final String mobile;
   String address;

  User(
      {required this.name,
      required this.email,
      required this.mobile,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "mobile": mobile, "address": address};
  }
}
