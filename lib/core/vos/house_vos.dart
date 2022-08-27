// To parse this JSON data, do
//
//     final houseVo = houseVoFromJson(jsonString);

import 'dart:convert';

List<HouseVo> houseVoFromJson(String str) =>
    List<HouseVo>.from(json.decode(str).map((x) => HouseVo.fromJson(x)));

String houseVoToJson(List<HouseVo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HouseVo {
  HouseVo({
    this.id,
    this.image,
    this.price,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.description,
    this.zip,
    this.city,
    this.latitude,
    this.longitude,
    this.createdDate,
  });

  int? id;
  String? image;
  int? price;
  int? bedrooms;
  int? bathrooms;
  int? size;
  String? description;
  String? zip;
  String? city;
  int? latitude;
  int? longitude;
  String? createdDate;

  factory HouseVo.fromJson(Map<String, dynamic> json) => HouseVo(
        id: json["id"],
        image: json["image"],
        price: json["price"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        size: json["size"],
        description: json["description"],
        zip: json["zip"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "price": price,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "size": size,
        "description": description,
        "zip": zip,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "createdDate": createdDate,
      };


}
