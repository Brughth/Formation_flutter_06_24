class PersonModel {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final String? image;

  PersonModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
