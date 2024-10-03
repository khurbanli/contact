import 'package:film_app/addcontact.dart';
import 'package:film_app/contact.dart';
import 'package:film_app/contact_detay.dart';
import 'package:film_app/contactdao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool aramaYapilirMi = false;
  String arananKelime = "";
  int chooseIndex = 0;

  Future<List<Contact>> all() async {
    var allList = Contactdao().allContact();
    return allList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: aramaYapilirMi
            ? TextField(
                decoration: const InputDecoration(
                    hintText: "search",
                    hintStyle: TextStyle(color: Colors.white60)),
                onChanged: (aramasonucu) {
                  setState(() {
                    arananKelime = aramasonucu;
                  });
                },
              )
            : const Text(
                "Contact",
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          aramaYapilirMi
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapilirMi = false;
                      arananKelime = "";
                    });
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 30,
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapilirMi = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )),
        ],
      ),
      body: FutureBuilder(
        future: all(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var contactList = snapshot.data;
            return ListView.builder(
              itemCount: contactList!.length,
              itemBuilder: (context, index) {
                var contact = contactList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ContactDetay(contact: contact)));
                  },
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact.name,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(contact.number,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.black54)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.lightGreen),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Setting"),
              onTap: () {
                setState(() {
                  chooseIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore_from_trash),
              title: const Text("Trash"),
              onTap: () {
                setState(() {
                  chooseIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            Spacer(),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text("Support"),
              onTap: () {
                setState(() {
                  chooseIndex = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addcontact()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
    );
  }
}
