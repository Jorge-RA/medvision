import 'package:flutter/material.dart';
import 'package:medvision_app/models/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        trailing: Column(
          children: [
            Text('ID #${person.personId}'),
            const SizedBox(height: 5),
            if (person.isMarried!)
              const Icon(
                Icons.favorite,
                color: Colors.red,
              )
          ],
        ),
        title: Text(person.firstName! + person.lastName!),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${person.birthDate!.year}-${person.birthDate!.month}-${person.birthDate!.day}'),
            Row(
              children: [
                const Icon(Icons.height),
                Text('${person.height}'),
                const SizedBox(width: 20),
                const Icon(Icons.house),
                Text('${person.houses!.length}'),
              ],
            ),
          ],
        ),
        onTap: (){
          Navigator.of(context).pushNamed('/houses', arguments: person);
        },
      ),
    );
  }
}
