import 'package:flutter/material.dart';

class ShopProduct {
  final String id;
  final String image;
  final List<Color> colors;
  final double rating;
  final double price;
  final bool isFavourite;
  final bool isPopular;
  final String title;
  final String description;
  final String category;

  ShopProduct({
    required this.id,
    required this.image,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  factory ShopProduct.fromMap(Map<String, dynamic> map, String id) {
    return ShopProduct(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      rating: (map['rating'] ?? 0.0).toDouble(),
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      category: map['category'] ?? '',
      colors: [],
    );
  }
}
