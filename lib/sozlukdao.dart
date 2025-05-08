
import 'package:sozluk/sozluk.dart';
import 'package:sozluk/veritabaniyardimcisi.dart';

class Sozlukdao {
  Future<List<sozluk>> getir() async{
  var db = await veritabaniYardimcisi.veritabaniErisim();

  List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM sozluk");
  return List.generate(maps.length, (i){
    var satir = maps[i];
    return sozluk(satir["kelime_id"], satir["kelime"], satir["anlami"]);
  });
  }
    }