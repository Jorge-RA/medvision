
import 'package:flutter/material.dart';

import 'package:change_notifier_builder/change_notifier_builder.dart';
import 'package:medvision_app/controllers/button_controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.text,
    required this.onPressed, 
    required this.controller,
  }) : super(key: key);

  final Size size;
  final String text;
  final void Function() onPressed;
  final ButtonController controller;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierBuilder(
      notifier: controller,
      builder: (context, _, __){
        return MaterialButton(
          minWidth: size.width * 0.5,
          height: size.height * 0.08,
          color: Colors.blue,
          disabledColor: Color.fromARGB(59, 158, 158, 158),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: controller.loading ? null : () => onPressed(),
          child: controller.loading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
        );
      },
    );
  }
}
