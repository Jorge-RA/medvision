// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medvision_app/controllers/button_controller.dart';
import 'package:medvision_app/models/house.dart';
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/services/http_persons.dart';
import 'package:medvision_app/widgets/custom_button.dart';
import 'package:medvision_app/widgets/custom_text_form_field.dart';
import 'package:medvision_app/widgets/widgets.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({Key? key}) : super(key: key);

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  bool isMarried = false;
  Person newPerson = Person();
  ButtonController buttonController = ButtonController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar persona'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'First Name',
              icon: Icons.abc_outlined,
              onChanged: (value) => newPerson.firstName = value,
            ),
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'Last Name',
              icon: Icons.abc_outlined,
              onChanged: (value) => newPerson.lastName = value,
            ),
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'Document',
              icon: Icons.abc_outlined,
              onChanged: (value) => newPerson.document = value,
            ),
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              controller: textEditingController,
              label: 'BrithDate',
              icon: Icons.abc_outlined,
              onChanged: (value) {},
              onTap: () async {
                newPerson.birthDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );
                textEditingController.text = newPerson.birthDate.toString();
              },
            ),
            SizedBox(height: size.height * 0.05),

            CustomTextFormField(
              label: 'Height',
              icon: Icons.abc_outlined,
              onChanged: (value) => newPerson.height = int.tryParse(value),
            ),
            SizedBox(height: size.height * 0.05),

            CheckboxListTile(
              title: const Text('Is married?'),
              value: isMarried,
              onChanged: (value) {
                isMarried = value!;
                newPerson.isMarried = isMarried;
                setState(() {});
              },
            ),
            SizedBox(height: size.height * 0.05),

            CustomButton(
              controller: buttonController,
              size: size,
              text: 'Crear persona',
              onPressed: () async {
                buttonController.loading = true;
                final String? response = await HTTPPersons.addPerson(newPerson);
                print(response);
                buttonController.loading = false;
                await Dialogs.show(context, response ?? 'Persona agregada con éxito!');
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: size.height * 0.05),

          ],
        ),
      ),
    );
  }
}
