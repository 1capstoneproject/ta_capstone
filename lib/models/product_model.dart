class ProductModel {
  int tourism_id;
  String name;
  String description;
  double rating;
  double price;
  String status;
  String image;
  String images;
  int sold;

  ProductModel({
    required this.tourism_id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.status,
    required this.image,
    required this.images,
    required this.sold,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        tourism_id: json['toourism_id'],
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        price: json['price'],
        status: json['status'],
        image: json['image'],
        images: json['images'],
        sold: json['sold']);
  }
}
