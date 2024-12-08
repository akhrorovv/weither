// To parse this JSON data, do
//
//     final weatherResponse = weatherResponseFromJson(jsonString);

import 'dart:convert';

WeatherResponse weatherResponseFromJson(String str) => WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) => json.encode(data.toJson());

class WeatherResponse {
  Location? location;
  Current? current;

  WeatherResponse({
    this.location,
    this.current,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
  };
}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  double? precipMm;
  int? humidity;
  double? uv;

  Current({
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.precipMm,
    this.humidity,
    this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: json["temp_c"]?.toDouble(),
    isDay: json["is_day"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windKph: json["wind_kph"]?.toDouble(),
    precipMm: json["precip_mm"]?.toDouble(),
    humidity: json["humidity"],
    uv: json["uv"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_kph": windKph,
    "precip_mm": precipMm,
    "humidity": humidity,
    "uv": uv,
  };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Location {
  String? name;
  String? country;
  String? localtime;

  Location({
    this.name,
    this.country,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    country: json["country"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "localtime": localtime,
  };
}
