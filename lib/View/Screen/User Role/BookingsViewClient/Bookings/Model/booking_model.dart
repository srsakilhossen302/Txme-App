class BookingModel {
  final String name;
  final String service;
  final String price; // API থেকে শুধু amount আসবে
  final String date;
  final String time;

  BookingModel({
    required this.name,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
  });

  String get formattedPrice => "€$price (Hourly)";
}
