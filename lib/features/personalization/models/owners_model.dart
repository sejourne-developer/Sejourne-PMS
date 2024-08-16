class OwnersModel {
  final String imageUrl,
      userName,
      location,
      email,
      phone,
      propertyNum,
      totalEarning;

  OwnersModel({
    required this.imageUrl,
    required this.userName,
    required this.location,
    required this.email,
    required this.phone,
    required this.propertyNum,
    required this.totalEarning,
  });

  factory OwnersModel.formJson(Map<String, dynamic> json) => OwnersModel(
        imageUrl: json["imageUrl"],
        userName: json["userName"],
        location: json["location"],
        email: json["email"],
        phone: json["phone"],
        propertyNum: json["propertyNum"],
        totalEarning: json["totalEarning"],
      );
}
