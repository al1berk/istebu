import '../Çalışan/projesi.dart';

class Musteri {
  String isim;
  String soyisim;
  String telefonNumarasi;
  String il;
  String ilce;
  String ePosta;
  String id;
  List<Proje> projeler;
  Musteri(this.isim,this.soyisim,this.telefonNumarasi,this.il,this.ilce,this.ePosta,this.id,this.projeler);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isim': isim,
      'soyisim': soyisim,
      'numara': telefonNumarasi,
      'il':il,
      'ilce':ilce,
      'e posta': ePosta,
      'projeler': projeler.map((proje) => proje.toMap()).toList(),
    };
  }
  factory Musteri.fromMap(Map<String, dynamic> map) {
    return Musteri(
      map['id'],
      map['isim'],
      map["soyisim"],
      map['numara'],
      map['il'],
      map['ilce'],
      map['e posta'],
      (map['projeler'] as List).map((item) => Proje.fromMap(item)).toList(),
    );
  }
}