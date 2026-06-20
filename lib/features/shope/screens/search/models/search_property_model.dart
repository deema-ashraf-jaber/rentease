class SearchPropertyModel {
  final String image;
  final String title;
  final String location;
  final String price;
  final String rooms;
  final String baths;
  final String size;
  final String rating;
  final String status;
  final DateTime createdAt;
  final String description;

  const SearchPropertyModel({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rooms,
    required this.baths,
    required this.size,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.description,
  });
}