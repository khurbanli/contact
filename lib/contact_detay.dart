import 'package:film_app/contact.dart';
import 'package:flutter/material.dart';

class ContactDetay extends StatefulWidget {
  final Contact contact;
  ContactDetay({required this.contact});

  @override
  State<ContactDetay> createState() => _ContactDetayState();
}

class _ContactDetayState extends State<ContactDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert),
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text("block"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("delete"),
                    ),
                  ]),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.contact.name,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.contact.number,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call, size: 40),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.messenger_outlined, size: 40),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.telegram, size: 40),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'edit'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'share'),
        ],
      ),
    );
  }
}
