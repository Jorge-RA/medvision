
import 'package:flutter/material.dart';

class Dialogs{


    static Future<void> show(BuildContext context, String message) async{
      
      return await showDialog(
        context: context, 
        builder: (context){
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const Text('Mensaje',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(message),
                const SizedBox(height: 20),
          
              ],
            ),
          );
        },
      );


  }
  
}