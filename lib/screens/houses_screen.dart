import 'package:flutter/material.dart';
import 'package:medvision_app/models/house.dart';
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/widgets/widgets.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Person person = ModalRoute.of(context)!.settings.arguments as Person;
    List<House> houses = person.houses!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Casas del Owner #${person.personId}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: houses.length,
        itemBuilder: (_, index) {
          return HouseCard(
            house: houses[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/add_house', arguments: person);
        },
      ),
    );
  }
}
