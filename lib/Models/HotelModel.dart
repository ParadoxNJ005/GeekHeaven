class Example {
  bool? status;
  String? message;
  int? timestamp;
  Data? data;

  Example({this.status, this.message, this.timestamp, this.data});

  Example.fromJson(Map<String, dynamic> json) {
    // Handle type conversion for status
    var statusValue = json["status"];
    if (statusValue is String) {
      status = statusValue.toLowerCase() == 'true';
    } else if (statusValue is bool) {
      status = statusValue;
    }
    message = json["message"];
    timestamp = json["timestamp"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["timestamp"] = timestamp;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? sortDisclaimer;
  List<Data1>? data;

  Data({this.sortDisclaimer, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    sortDisclaimer = json["sortDisclaimer"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sortDisclaimer"] = sortDisclaimer;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data1 {
  String? id;
  String? title;
  String? primaryInfo;
  String? secondaryInfo;
  Badge? badge;
  BubbleRating? bubbleRating;
  bool? isSponsored;
  bool? accentedLabel;
  String? provider;
  dynamic priceForDisplay;
  dynamic strikethroughPrice;
  dynamic priceDetails;
  dynamic priceSummary;
  List<CardPhotos>? cardPhotos;

  Data1({
    this.id,
    this.title,
    this.primaryInfo,
    this.secondaryInfo,
    this.badge,
    this.bubbleRating,
    this.isSponsored,
    this.accentedLabel,
    this.provider,
    this.priceForDisplay,
    this.strikethroughPrice,
    this.priceDetails,
    this.priceSummary,
    this.cardPhotos,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    primaryInfo = json["primaryInfo"];
    secondaryInfo = json["secondaryInfo"];
    badge = json["badge"] == null ? null : Badge.fromJson(json["badge"]);
    bubbleRating = json["bubbleRating"] == null ? null : BubbleRating.fromJson(json["bubbleRating"]);

    var isSponsoredValue = json["isSponsored"];
    if (isSponsoredValue is String) {
      isSponsored = isSponsoredValue.toLowerCase() == 'true';
    } else if (isSponsoredValue is bool) {
      isSponsored = isSponsoredValue;
    }

    var accentedLabelValue = json["accentedLabel"];
    if (accentedLabelValue is String) {
      accentedLabel = accentedLabelValue.toLowerCase() == 'true';
    } else if (accentedLabelValue is bool) {
      accentedLabel = accentedLabelValue;
    }

    provider = json["provider"];
    priceForDisplay = json["priceForDisplay"];
    strikethroughPrice = json["strikethroughPrice"];
    priceDetails = json["priceDetails"];
    priceSummary = json["priceSummary"];
    cardPhotos = json["cardPhotos"] == null ? null : (json["cardPhotos"] as List).map((e) => CardPhotos.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["primaryInfo"] = primaryInfo;
    _data["secondaryInfo"] = secondaryInfo;
    if (badge != null) {
      _data["badge"] = badge?.toJson();
    }
    if (bubbleRating != null) {
      _data["bubbleRating"] = bubbleRating?.toJson();
    }
    _data["isSponsored"] = isSponsored;
    _data["accentedLabel"] = accentedLabel;
    _data["provider"] = provider;
    _data["priceForDisplay"] = priceForDisplay;
    _data["strikethroughPrice"] = strikethroughPrice;
    _data["priceDetails"] = priceDetails;
    _data["priceSummary"] = priceSummary;
    if (cardPhotos != null) {
      _data["cardPhotos"] = cardPhotos?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CardPhotos {
  String? typename;
  Sizes? sizes;

  CardPhotos({this.typename, this.sizes});

  CardPhotos.fromJson(Map<String, dynamic> json) {
    typename = json["__typename"];
    sizes = json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["__typename"] = typename;
    if (sizes != null) {
      _data["sizes"] = sizes?.toJson();
    }
    return _data;
  }
}

class Sizes {
  String? typename;
  int? maxHeight;
  int? maxWidth;
  String? urlTemplate;

  Sizes({this.typename, this.maxHeight, this.maxWidth, this.urlTemplate});

  Sizes.fromJson(Map<String, dynamic> json) {
    typename = json["__typename"];
    maxHeight = json["maxHeight"];
    maxWidth = json["maxWidth"];
    urlTemplate = json["urlTemplate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["__typename"] = typename;
    _data["maxHeight"] = maxHeight;
    _data["maxWidth"] = maxWidth;
    _data["urlTemplate"] = urlTemplate;
    return _data;
  }
}

class BubbleRating {
  String? count;
  double? rating;

  BubbleRating({this.count, this.rating});

  BubbleRating.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    // Handle both int and double for rating
    var ratingValue = json["rating"];
    if (ratingValue is int) {
      rating = ratingValue.toDouble();
    } else if (ratingValue is double) {
      rating = ratingValue;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["rating"] = rating;
    return _data;
  }
}

class Badge {
  Badge();

  Badge.fromJson(Map<String, dynamic> json) {
    // Add fields if required
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    // Add fields if required
    return _data;
  }
}
