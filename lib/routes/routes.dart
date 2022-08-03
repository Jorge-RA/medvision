import 'package:flutter/material.dart';
import 'package:medvision_app/screens/screens.dart';




class Routes{

  static String initialRoute = '/';
  
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (_) => HomeScreen(),
    '/houses' : (_) => HousesScreen(),
    '/add_person' : (_) => AddPersonScreen(),
    '/add_house' : (_) => AddHouseScreen(),
  };


}
  