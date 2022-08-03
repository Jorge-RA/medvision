
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function(String value) onChanged;
  final void Function()? onTap;
  final TextInputType? keyboard;
  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextFormField(
    {Key? key, 
    required this.label, 
    required this.icon,
    required this.onChanged,
    this.keyboard,
    this.maxLines, 
    this.onTap, 
    this.controller,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(50, 33, 149, 243),
        labelText: label,
        prefixIcon: Icon(icon),   
        contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.06),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.05),
          borderSide: BorderSide.none,
        ),
        
      ),

      onChanged: (value){
          onChanged(value);
        
      },

      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },

      keyboardType: keyboard,
      
    );
  }
}