class ProductModel {
  final int id;
  var price;
  final String title;
  final String description;
  final String image;
  final String category;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        category: json['category'],
        rating: Rating.fromJson(json['rating']));
  }
}

class Rating {
  var count;
  var rate;
  Rating({
    required this.count,
    required this.rate,
  });
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(count: json['count'], rate: json['rate']);
  }
}
