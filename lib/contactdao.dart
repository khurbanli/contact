import 'package:film_app/contact.dart';
import 'package:film_app/veritaban.dart';

class Contactdao {
  Future<List<Contact>> allContact() async {
    var db = await Veritaban.veritabanErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Contact");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Contact(satir["id"], satir["name"], satir["number"]);
    });
  }

  Future<void> addContact(String name, String number) async {
    var db = await Veritaban.veritabanErisim();
    var info = Map<String, dynamic>();
    info["name"] = name;
    info["number"] = number;
    await db.insert("Contact", info);
  }

  Future<void> deleteContact(int id) async {
    var db = await Veritaban.veritabanErisim();
    await db.delete("Contact", where: "id= ?", whereArgs: [id]);
  }
}
