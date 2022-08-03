import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medvision_app/models/house.dart';
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/services/services.dart';

class HTTPHouses{

  static const String url = 'hiring.medvision.com.co';

    static Future<String?> addHouse(House house) async{

    final uri = Uri.http(url, '/api/House/addHouse');

    final response = await http.post(
      uri,
      headers: {
        'Authorization' : 'Bearer ${HTTPAuth.token}',
        'Accept': 'application/json',
        'Content-Type' : 'application/json'
      },
      body: json.encode(
        house.toJsonAddHouse(),
      )
    );
    print(response.body);
    if(response.statusCode == 200){//Toddo correcto
      return null;
    }else{
      //Hubo un error
      return response.body;
    }


  }
}