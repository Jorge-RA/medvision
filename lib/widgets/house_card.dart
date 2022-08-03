import 'package:flutter/material.dart';
import 'package:medvision_app/models/house.dart';
import 'package:medvision_app/models/person.dart';

class HouseCard extends StatelessWidget {
  final House house;
  const HouseCard({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.house),
        trailing: Column(
          children: [
            Text('ID #${house.houseId}'),
            const SizedBox(height: 5),
           
          ],
        ),
        title: Text(house.description!),
      ),
    );
  }
}
