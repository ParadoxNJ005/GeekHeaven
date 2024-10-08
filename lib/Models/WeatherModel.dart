class Wea {
  Wea({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  late final Coord coord;
  late final List<Weather> weather;
  late final String base;
  late final Main main;
  late final int visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final int dt;
  late final Sys sys;
  late final int timezone;
  late final int id;
  late final String name;
  late final int cod;

  Wea.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    base = json['base'] ?? '';
    main = Main.fromJson(json['main']);
    visibility = json['visibility'] ?? 0;
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = json['dt'] ?? 0;
    sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    cod = json['cod'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coord'] = coord.toJson();
    data['weather'] = weather.map((e) => e.toJson()).toList();
    data['base'] = base;
    data['main'] = main.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind.toJson();
    data['clouds'] = clouds.toJson();
    data['dt'] = dt;
    data['sys'] = sys.toJson();
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon'] as num?)?.toDouble() ?? 0.0;
    lat = (json['lat'] as num?)?.toDouble() ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    main = json['main'] ?? '';
    description = json['description'] ?? '';
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;
  late final int? seaLevel;
  late final int? grndLevel;

  Main.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble() ?? 0.0;
    feelsLike = (json['feels_like'] as num?)?.toDouble() ?? 0.0;
    tempMin = (json['temp_min'] as num?)?.toDouble() ?? 0.0;
    tempMax = (json['temp_max'] as num?)?.toDouble() ?? 0.0;
    pressure = json['pressure'] ?? 0;
    humidity = json['humidity'] ?? 0;
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  late final double speed;
  late final int deg;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = (json['speed'] as num?)?.toDouble() ?? 0.0;
    deg = json['deg'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    return data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  late final int? type;
  late final int? id;
  late final String country;
  late final int sunrise;
  late final int sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'] ?? '';
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
