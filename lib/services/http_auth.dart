import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPAuth{
  static const String url = 'hiring.medvision.com.co';
  static String token = '';

  static getToken() async{
    final uri = Uri.http(url, '/api/Auth');

    final response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type' : 'application/json'
      },
      body: json.encode({
        'username' : 'USerMvs005',
        'password' : 'Zanahoria Dubai2021'
      }),
    );


    final decodedData = json.decode(response.body);

    token = decodedData['token']; 

    print(token);

  }




}