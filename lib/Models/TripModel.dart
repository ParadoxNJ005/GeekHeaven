class TripModel {
  String name;
  String date;
  String flight;
  String hotel;
  String price;
  String url;

  // Required named parameters to ensure non-nullable values
  TripModel({
    required this.name,
    required this.date,
    required this.flight,
    required this.hotel,
    required this.price,
    required this.url,
  });

  // Factory constructor to handle JSON and ensure non-nullable values
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      name: json["name"] ?? "",
      date: json["date"] ?? "",
      flight: json["flight"] ?? "",
      hotel: json["hotel"] ?? "",
      price: json["price"] ?? "",
      url: json["url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["date"] = date;
    _data["flight"] = flight;
    _data["hotel"] = hotel;
    _data["price"] = price;
    _data["url"] = url;
    return _data;
  }
}
