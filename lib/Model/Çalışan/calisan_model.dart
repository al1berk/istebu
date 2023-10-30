import 'package:istebu/Model/%C3%87al%C4%B1%C5%9Fan/projesi.dart';

class Calisan {
  String isim;
  String soyisim;
  String universite;
  String bolum;
  int saatlikUcret;
  String imageUrl;
  List<String> alan;
  String numara;
  List<Proje> projeler;
  String id;

  Calisan(this.imageUrl, this.saatlikUcret, this.isim,this.soyisim, this.alan, this.bolum, this.universite, this.numara, this.projeler, this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isim': isim,
      'soyisim': soyisim,
      'universite': universite,
      'bolum': bolum,
      'saatlikUcret': saatlikUcret,
      'imageUrl': imageUrl,
      'alan': alan,
      'numara': numara,
      'projeler': projeler.map((proje) => proje.toMap()).toList(),
    };
  }

  factory Calisan.fromMap(Map<String, dynamic> map) {
    return Calisan(
      map['imageUrl'],
      map['saatlikUcret'],
      map['isim'],
      map["soyisim"],
      List<String>.from(map['alan']),
      map['bolum'],
      map['universite'],
      map['numara'],
      (map['projeler'] as List).map((item) => Proje.fromMap(item)).toList(),
      map["id"],
    );
  }
}


