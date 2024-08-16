class ChartModel {
  final String total;
  final String title;
  // final String subTitle;
  final String iconUrl;
  final String growth;
  final String percentage;

  ChartModel({
    required this.total,
    required this.title,
    // required this.subTitle,
    required this.iconUrl,
    required this.growth,
    required this.percentage,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        total: json["total"].toString(),
        title: json["title"].toString(),
        // subTitle: json["subTitle"].toString(),
        iconUrl: json["iconUrl"].toString(),
        growth: json["growth"].toString(),
        percentage: json["percentage"].toString(),
      );
}
