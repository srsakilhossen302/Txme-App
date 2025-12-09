class ReviewModel {
  final String name;
  final String profile;
  final String date;
  final double rating;
  final String comment;

  ReviewModel({
    required this.name,
    required this.profile,
    required this.date,
    required this.rating,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"] ?? "",
      profile: json["profile"] ?? "",
      date: json["date"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      comment: json["comment"] ?? "",
    );
  }
}
