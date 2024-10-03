import 'package:film_app/contactdao.dart';
import 'package:film_app/main.dart';
import 'package:flutter/material.dart';

class Addcontact extends StatefulWidget {
  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  int selectIndex = 0;
  void saveData() {
    print("saved");
  }

  Future<void> add(String name, String number) async {
    await Contactdao().addContact(name, number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            Text(""),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'share'),
          BottomNavigationBarItem(icon: Icon(Icons.block), label: 'block'),
        ],
        currentIndex: selectIndex,
        onTap: (int index) {
          if (index == 0) {
            saveData();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }
        },
      ),
    );
  }
}
