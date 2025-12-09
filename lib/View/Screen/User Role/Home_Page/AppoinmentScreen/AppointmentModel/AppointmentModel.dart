class AppointmentModel {
  final String name;
  final String image;
  final String date;
  final String description;
  final String status;

  AppointmentModel({
    required this.name,
    required this.image,
    required this.date,
    required this.description,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json["name"],
      image: json["image"],
      date: json["date"],
      description: json["description"],
      status: json["status"],
    );
  }
}
