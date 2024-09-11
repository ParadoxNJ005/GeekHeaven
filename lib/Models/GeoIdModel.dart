class GeoIdModelDart {
  bool? status;
  String? message;
  int? timestamp;
  List<Data>? data;

  GeoIdModelDart({this.status, this.message, this.timestamp, this.data});

  GeoIdModelDart.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    timestamp = json["timestamp"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["timestamp"] = timestamp;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? title;
  int? geoId;
  String? documentId;
  String? trackingItems;
  String? secondaryText;

  Data({this.title, this.geoId, this.documentId, this.trackingItems, this.secondaryText});

  Data.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    geoId = json["geoId"];
    documentId = json["documentId"];
    trackingItems = json["trackingItems"];
    secondaryText = json["secondaryText"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["geoId"] = geoId;
    _data["documentId"] = documentId;
    _data["trackingItems"] = trackingItems;
    _data["secondaryText"] = secondaryText;
    return _data;
  }
}
