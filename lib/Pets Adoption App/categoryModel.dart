class CategoriesModel {
  final String id;
  final String name;
  final String photo;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}
