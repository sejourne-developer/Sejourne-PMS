class ReservationModel {
  final String total;
  final String title;
  final String referenceNumberAndType;
  final String imageUrl;
  final String userName;
  final String location;
  final String checkInDate;
  final String checkOutDate;
  final String price;
  final String revenue;
  final String nights;

  ReservationModel({
    required this.total,
    required this.title,
    required this.referenceNumberAndType,
    required this.imageUrl,
    required this.userName,
    required this.location,
    required this.checkInDate,
    required this.checkOutDate,
    required this.price,
    required this.revenue,
    required this.nights,
  });

  factory ReservationModel.fromJson(Map<String ,dynamic> json)=>ReservationModel(
    total: json["total"].toString(),
    title: json["title"].toString(),
    imageUrl: json["imageUrl"].toString(),
    userName: json["userName"].toString(),
    location: json["location"].toString(),
    checkInDate: json["checkInDate"].toString(),
    checkOutDate: json["checkOutDate"].toString(),
    price: json["price"].toString(),
    revenue: json["revenue"].toString(),
    referenceNumberAndType: json["referenceNumberAndType"].toString(),
    nights: json["nights"].toString()
  );

}
