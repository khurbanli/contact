import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Veritaban {
  static String veritabanAdi = "contact.sqlite";
  static Future<Database> veritabanErisim() async {
    String veritabanYolu = join(await getDatabasesPath(), veritabanAdi);
    if (await databaseExists(veritabanYolu)) {
      print("hazirda var kopyalamaya ehtiyac yoxdur");
    } else {
      ByteData data = await rootBundle.load("lib/baza/$veritabanAdi");
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabanYolu).writeAsBytes(bytes, flush: true);
      print("kopyalandi");
    }
    return openDatabase(veritabanYolu);
  }
}
