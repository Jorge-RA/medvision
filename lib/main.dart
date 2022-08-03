import 'package:flutter/material.dart';
import 'package:medvision_app/routes/routes.dart';
import 'package:medvision_app/services/http_auth.dart';

void main() async{
  await HTTPAuth.getToken();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}