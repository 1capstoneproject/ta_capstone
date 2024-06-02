class TourismModel {
  dynamic id;
  String name;
  String description;
  double rating;
  String address;

  TourismModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.address,
  });

  factory TourismModel.fromJson(Map<String, dynamic> json) {
    return TourismModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      address: json['address'],
    );
  }
}
