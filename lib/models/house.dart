// To parse this JSON data, do
//
//     final house = houseFromJson(jsonString);

import 'dart:convert';

import 'package:medvision_app/models/person.dart';

List<House> houseFromJson(String str) => List<House>.from(json.decode(str).map((x) => House.fromJson(x)));

String houseToJson(List<House> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class House {
    House({
        this.houseId,
        this.description,
        this.address,
        this.ownerId,
    });

    int? houseId;
    String? description;
    String? address;
    int? ownerId;
    Person? person;

    factory House.fromJson(Map<String, dynamic> json) => House(
        houseId: json["houseID"],
        description: json["description"],
        address: json["address"],
        ownerId: json["ownerID"],
    );

    Map<String, dynamic> toJson() => {
        //"houseID": houseId,
        "description": description,
        "address": address,
        "ownerID": ownerId,
    };

     Map<String, dynamic> toJsonAddHouse() => {
        "description": description,
        "address": address,
        "ownerID": ownerId,
        'owner' : person!.toJson(),
    };
}


