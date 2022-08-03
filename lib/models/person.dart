// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

import 'package:medvision_app/models/house.dart';



class Person {



static String personsToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
static List<Person> listPersonsFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

    Person({
        this.personId,
        this.document,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.isMarried,
        this.height,
        this.houses,
    }){
      houses ??= [];
    }

    int? personId;
    String? document;
    String? firstName;
    String? lastName;
    DateTime? birthDate;
    bool? isMarried;
    int? height;
    List<House>? houses;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        personId: json["personID"],
        document: json["document"] ?? 'Sin documento',
        firstName: json["firstName"],
        lastName: json["lastName"] ?? '',
        birthDate: DateTime.parse(json["birthDate"]),
        isMarried: json["isMarried"],
        height: json["height"] ?? 0,
        houses: List<House>.from(json["houses"].map((x) => House.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        //"personID": personId,
        "document": document ?? '00000',
        "firstName": firstName,
        "lastName": lastName ?? '',
        "birthDate": birthDate.toString(),
        "isMarried": isMarried,
        "height": height ?? 0,
        "houses":  List<dynamic>.from(houses!.map((x) => x.toJson())),
    };
}

