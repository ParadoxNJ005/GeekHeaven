class FlightModelDart {
  bool? status;
  String? message;
  int? timestamp;
  Data? data;

  FlightModelDart({this.status, this.message, this.timestamp, this.data});

  FlightModelDart.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    timestamp = json["timestamp"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["timestamp"] = timestamp;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  Session? session;
  bool? complete;
  int? numOfFilters;
  int? totalNumResults;
  List<Flights>? flights;

  Data({this.session, this.complete, this.numOfFilters, this.totalNumResults, this.flights});

  Data.fromJson(Map<String, dynamic> json) {
    session = json["session"] == null ? null : Session.fromJson(json["session"]);
    complete = json["complete"];
    numOfFilters = json["numOfFilters"];
    totalNumResults = json["totalNumResults"];
    flights = json["flights"] == null ? null : (json["flights"] as List).map((e) => Flights.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(session != null) {
      _data["session"] = session?.toJson();
    }
    _data["complete"] = complete;
    _data["numOfFilters"] = numOfFilters;
    _data["totalNumResults"] = totalNumResults;
    if(flights != null) {
      _data["flights"] = flights?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Flights {
  List<Segments>? segments;
  List<PurchaseLinks>? purchaseLinks;

  Flights({this.segments, this.purchaseLinks});

  Flights.fromJson(Map<String, dynamic> json) {
    segments = json["segments"] == null ? null : (json["segments"] as List).map((e) => Segments.fromJson(e)).toList();
    purchaseLinks = json["purchaseLinks"] == null ? null : (json["purchaseLinks"] as List).map((e) => PurchaseLinks.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(segments != null) {
      _data["segments"] = segments?.map((e) => e.toJson()).toList();
    }
    if(purchaseLinks != null) {
      _data["purchaseLinks"] = purchaseLinks?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PurchaseLinks {
  String? purchaseLinkId;
  String? providerId;
  PartnerSuppliedProvider? partnerSuppliedProvider;
  String? commerceName;
  String? currency;
  String? originalCurrency;
  int? seatAvailability;
  int? taxesAndFees;
  int? taxesAndFeesPerPassenger;
  int? totalPrice;
  int? totalPricePerPassenger;
  List<dynamic>? fareBasisCodes;
  List<dynamic>? containedPurchaseLinks;
  PartnerData? partnerData;
  bool? isPaid;
  List<dynamic>? fareAttributesList;
  String? url;

  PurchaseLinks({this.purchaseLinkId, this.providerId, this.partnerSuppliedProvider, this.commerceName, this.currency, this.originalCurrency, this.seatAvailability, this.taxesAndFees, this.taxesAndFeesPerPassenger, this.totalPrice, this.totalPricePerPassenger, this.fareBasisCodes, this.containedPurchaseLinks, this.partnerData, this.isPaid, this.fareAttributesList, this.url});

  PurchaseLinks.fromJson(Map<String, dynamic> json) {
    purchaseLinkId = json["purchaseLinkId"];
    providerId = json["providerId"];
    partnerSuppliedProvider = json["partnerSuppliedProvider"] == null ? null : PartnerSuppliedProvider.fromJson(json["partnerSuppliedProvider"]);
    commerceName = json["commerceName"];
    currency = json["currency"];
    originalCurrency = json["originalCurrency"];
    seatAvailability = json["seatAvailability"];
    taxesAndFees = json["taxesAndFees"];
    taxesAndFeesPerPassenger = json["taxesAndFeesPerPassenger"];
    totalPrice = json["totalPrice"];
    totalPricePerPassenger = json["totalPricePerPassenger"];
    fareBasisCodes = json["fareBasisCodes"] ?? [];
    containedPurchaseLinks = json["containedPurchaseLinks"] ?? [];
    partnerData = json["partnerData"] == null ? null : PartnerData.fromJson(json["partnerData"]);
    isPaid = json["isPaid"];
    fareAttributesList = json["fareAttributesList"] ?? [];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["purchaseLinkId"] = purchaseLinkId;
    _data["providerId"] = providerId;
    if(partnerSuppliedProvider != null) {
      _data["partnerSuppliedProvider"] = partnerSuppliedProvider?.toJson();
    }
    _data["commerceName"] = commerceName;
    _data["currency"] = currency;
    _data["originalCurrency"] = originalCurrency;
    _data["seatAvailability"] = seatAvailability;
    _data["taxesAndFees"] = taxesAndFees;
    _data["taxesAndFeesPerPassenger"] = taxesAndFeesPerPassenger;
    _data["totalPrice"] = totalPrice;
    _data["totalPricePerPassenger"] = totalPricePerPassenger;
    if(fareBasisCodes != null) {
      _data["fareBasisCodes"] = fareBasisCodes;
    }
    if(containedPurchaseLinks != null) {
      _data["containedPurchaseLinks"] = containedPurchaseLinks;
    }
    if(partnerData != null) {
      _data["partnerData"] = partnerData?.toJson();
    }
    _data["isPaid"] = isPaid;
    if(fareAttributesList != null) {
      _data["fareAttributesList"] = fareAttributesList;
    }
    _data["url"] = url;
    return _data;
  }
}

class PartnerData {
  PartnerData();

  PartnerData.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}

class PartnerSuppliedProvider {
  String? id;
  String? displayName;
  String? logoUrl;

  PartnerSuppliedProvider({this.id, this.displayName, this.logoUrl});

  PartnerSuppliedProvider.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    displayName = json["displayName"];
    logoUrl = json["logoUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["displayName"] = displayName;
    _data["logoUrl"] = logoUrl;
    return _data;
  }
}

class Segments {
  List<Legs>? legs;
  List<dynamic>? layovers;

  Segments({this.legs, this.layovers});

  Segments.fromJson(Map<String, dynamic> json) {
    legs = json["legs"] == null ? null : (json["legs"] as List).map((e) => Legs.fromJson(e)).toList();
    layovers = json["layovers"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(legs != null) {
      _data["legs"] = legs?.map((e) => e.toJson()).toList();
    }
    if(layovers != null) {
      _data["layovers"] = layovers;
    }
    return _data;
  }
}

class Legs {
  String? originStationCode;
  bool? isDifferentOriginStation;
  String? destinationStationCode;
  bool? isDifferentDestinationStation;
  String? departureDateTime;
  String? arrivalDateTime;
  String? classOfService;
  String? marketingCarrierCode;
  String? operatingCarrierCode;
  List<dynamic>? amenities;
  int? flightNumber;
  int? seatGuruEquipmentId;
  String? seatGuruAirlineUrl;
  int? numStops;
  double? distanceInKm;
  bool? isInternational;
  bool? selfTransfer;
  OperatingCarrier? operatingCarrier;
  MarketingCarrier? marketingCarrier;

  Legs({this.originStationCode, this.isDifferentOriginStation, this.destinationStationCode, this.isDifferentDestinationStation, this.departureDateTime, this.arrivalDateTime, this.classOfService, this.marketingCarrierCode, this.operatingCarrierCode, this.amenities, this.flightNumber, this.seatGuruEquipmentId, this.seatGuruAirlineUrl, this.numStops, this.distanceInKm, this.isInternational, this.selfTransfer, this.operatingCarrier, this.marketingCarrier});

  Legs.fromJson(Map<String, dynamic> json) {
    originStationCode = json["originStationCode"];
    isDifferentOriginStation = json["isDifferentOriginStation"];
    destinationStationCode = json["destinationStationCode"];
    isDifferentDestinationStation = json["isDifferentDestinationStation"];
    departureDateTime = json["departureDateTime"];
    arrivalDateTime = json["arrivalDateTime"];
    classOfService = json["classOfService"];
    marketingCarrierCode = json["marketingCarrierCode"];
    operatingCarrierCode = json["operatingCarrierCode"];
    amenities = json["amenities"] ?? [];
    flightNumber = json["flightNumber"];
    seatGuruEquipmentId = json["seatGuruEquipmentId"];
    seatGuruAirlineUrl = json["seatGuruAirlineUrl"];
    numStops = json["numStops"];
    distanceInKm = json["distanceInKM"];
    isInternational = json["isInternational"];
    selfTransfer = json["selfTransfer"];
    operatingCarrier = json["operatingCarrier"] == null ? null : OperatingCarrier.fromJson(json["operatingCarrier"]);
    marketingCarrier = json["marketingCarrier"] == null ? null : MarketingCarrier.fromJson(json["marketingCarrier"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["originStationCode"] = originStationCode;
    _data["isDifferentOriginStation"] = isDifferentOriginStation;
    _data["destinationStationCode"] = destinationStationCode;
    _data["isDifferentDestinationStation"] = isDifferentDestinationStation;
    _data["departureDateTime"] = departureDateTime;
    _data["arrivalDateTime"] = arrivalDateTime;
    _data["classOfService"] = classOfService;
    _data["marketingCarrierCode"] = marketingCarrierCode;
    _data["operatingCarrierCode"] = operatingCarrierCode;
    if(amenities != null) {
      _data["amenities"] = amenities;
    }
    _data["flightNumber"] = flightNumber;
    _data["seatGuruEquipmentId"] = seatGuruEquipmentId;
    _data["seatGuruAirlineUrl"] = seatGuruAirlineUrl;
    _data["numStops"] = numStops;
    _data["distanceInKM"] = distanceInKm;
    _data["isInternational"] = isInternational;
    _data["selfTransfer"] = selfTransfer;
    if(operatingCarrier != null) {
      _data["operatingCarrier"] = operatingCarrier?.toJson();
    }
    if(marketingCarrier != null) {
      _data["marketingCarrier"] = marketingCarrier?.toJson();
    }
    return _data;
  }
}

class MarketingCarrier {
  int? locationId;
  String? code;
  String? logoUrl;
  String? displayName;

  MarketingCarrier({this.locationId, this.code, this.logoUrl, this.displayName});

  MarketingCarrier.fromJson(Map<String, dynamic> json) {
    locationId = json["locationId"];
    code = json["code"];
    logoUrl = json["logoUrl"];
    displayName = json["displayName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["locationId"] = locationId;
    _data["code"] = code;
    _data["logoUrl"] = logoUrl;
    _data["displayName"] = displayName;
    return _data;
  }
}

class OperatingCarrier {
  int? locationId;
  String? code;
  String? logoUrl;
  String? displayName;

  OperatingCarrier({this.locationId, this.code, this.logoUrl, this.displayName});

  OperatingCarrier.fromJson(Map<String, dynamic> json) {
    locationId = json["locationId"];
    code = json["code"];
    logoUrl = json["logoUrl"];
    displayName = json["displayName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["locationId"] = locationId;
    _data["code"] = code;
    _data["logoUrl"] = logoUrl;
    _data["displayName"] = displayName;
    return _data;
  }
}

class Session {
  String? searchHash;
  String? pageLoadUid;
  String? searchId;

  Session({this.searchHash, this.pageLoadUid, this.searchId});

  Session.fromJson(Map<String, dynamic> json) {
    searchHash = json["searchHash"];
    pageLoadUid = json["pageLoadUid"];
    searchId = json["searchId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["searchHash"] = searchHash;
    _data["pageLoadUid"] = pageLoadUid;
    _data["searchId"] = searchId;
    return _data;
  }
}