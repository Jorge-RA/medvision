import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/services/services.dart';

class HTTPPersons{

  static const String url = 'hiring.medvision.com.co';

  static Future<List<Person>> getAllPersons() async{

    final uri = Uri.http(url, '/api/Person/GetAllPeople');

    final response = await http.get(
      uri,
      headers: {
        'Authorization' : 'Bearer ${HTTPAuth.token}'
      }  ,
    );

    if(response.statusCode == 200){//Toddo correcto
      final List<Person> myList = Person.listPersonsFromJson(response.body);
      return myList;
    }else{
      //Hubo un error
      return [];
    }


  }

  static Future<String?> addPerson(Person person) async{

    final uri = Uri.http(url, '/api/Person/addPerson');

    final response = await http.post(
      uri,
      headers: {
        'Authorization' : 'Bearer ${HTTPAuth.token}',
        'Accept': 'application/json',
        'Content-Type' : 'application/json'
      },
      body: json.encode(
        person.toJson(),
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