class Ilan {
  String ilanAlan;
  String ilanDal;
  String baslik;
  String musteriID;
  String aciklama;
  String tahminiSaat;
  String butce;
  String calisanID;
  String ilanID;
  bool bitti;
  String musteriYorumu;
  String musteriPuani;

  Ilan(
      this.ilanAlan,
      this.ilanDal,
      this.baslik,
      this.aciklama,
      this.tahminiSaat,
      this.butce,
      this.musteriID,
      this.calisanID,
      this.ilanID,
      this.bitti,
      this.musteriYorumu,
      this.musteriPuani
      );

  Map<String, dynamic> toMap() {
    return {
      'ilanAlan': ilanAlan,
      'ilanDal': ilanDal,
      'baslik': baslik,
      'aciklama': aciklama,
      'tahminiSaat':tahminiSaat,
      'butce':butce,
      'musteriID': musteriID,
      'calisanID': calisanID,
      'ilanID':ilanID,
      'bitti':bitti,
      'musteriYorumu': musteriYorumu,
      'musteriPuani': musteriPuani,
    };
  }
  factory Ilan.fromMap(Map<String, dynamic> map) {
    return Ilan(
      map['ilanAlan'],
      map['ilanDal'],
      map["baslik"],
      map['aciklama'],
      map['tahminiSaat'],
      map['butce'],
      map['musteriID'],
      map['calisanID'],
      map['ilanID'],
      map['bitti'],
      map['musteriYorumu'],
      map["musteriPuani"]
    );
  }
}
