import 'package:flutter/material.dart';
import 'package:medvision_app/models/person.dart';
import 'package:medvision_app/services/http_persons.dart';
import 'package:medvision_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<Person>>(
        future: HTTPPersons.getAllPersons(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) {
              return PersonCard(
                person: snapshot.data[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async{
          await Navigator.of(context).pushNamed('/add_person');
          setState(() {});
        },
      ),
    );
  }
}
