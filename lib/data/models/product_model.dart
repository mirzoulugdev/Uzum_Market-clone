class Product {
  int id;
  String title;
  String price;
  String description;
  String category;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toString(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );
}
