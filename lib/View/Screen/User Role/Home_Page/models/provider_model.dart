import 'package:txme_app/View/Screen/User%20Role/Home_Page/models/review_model.dart';

class ProviderModel {
  final String name;
  final String service;
  final String image;
  final double rating;
  final int orders;
  final int experience;
  final List<String> skills;
  final String availableFrom;
  final String availableTo;
  final int rate;
  final String bio;
  final List<ReviewModel> reviews;

  ProviderModel({
    required this.name,
    required this.service,
    required this.image,
    required this.rating,
    required this.orders,
    required this.experience,
    required this.skills,
    required this.availableFrom,
    required this.availableTo,
    required this.rate,
    required this.bio,
    required this.reviews,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      name: json["name"] ?? "",
      service: json["service"] ?? "",
      image: json["image"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      orders: json["orders"] ?? 0,
      experience: json["experience"] ?? 0,
      skills: List<String>.from(json["skills"] ?? []),
      availableFrom: json["available_from"] ?? "",
      availableTo: json["available_to"] ?? "",
      rate: json["rate"] ?? 0,
      bio: json["bio"] ?? "",
      reviews: (json["reviews"] ?? [])
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList(),
    );
  }
}
