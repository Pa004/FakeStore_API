import '../../domain/entities/store.dart';

class StoreModel extends Store{
  StoreModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.description,
  });

  // Convierte json (Fake Store) a objeto
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
    );
  }
}