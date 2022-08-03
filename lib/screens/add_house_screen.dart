// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medvision_app/controllers/button_controller.dart';
import 'package:medvision_app/models/house.dart';
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/services/http_houses.dart';
import 'package:medvision_app/services/http_persons.dart';
import 'package:medvision_app/widgets/custom_button.dart';
import 'package:medvision_app/widgets/custom_text_form_field.dart';
import 'package:medvision_app/widgets/widgets.dart';


class AddHouseScreen extends StatelessWidget{
  bool isMarried = false;
  House newHouse = House();
  ButtonController buttonController = ButtonController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final person = ModalRoute.of(context)!.settings.arguments as Person;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Casa'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'Description',
              icon: Icons.abc_outlined,
              onChanged: (value) => newHouse.description = value,
            ),
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'Address',
              icon: Icons.abc_outlined,
              onChanged: (value) => newHouse.address = value,
            ),
            SizedBox(height: size.height * 0.05),

            CustomButton(
              controller: buttonController,
              size: size,
              text: 'Crear Casa',
              onPressed: () async {
                newHouse.ownerId = person.personId;
                newHouse.person = person;
                buttonController.loading = true;
                final String? response = await HTTPHouses.addHouse(newHouse);
                print(response);
                buttonController.loading = false;
                await Dialogs.show(context, response ?? 'Casa agregada con éxito');
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            SizedBox(height: size.height * 0.05),

          ],
        ),
      ),
    );
  }
}
