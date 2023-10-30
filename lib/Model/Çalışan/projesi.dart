class Proje {
  double ucret;
  double musteriPuani;
  int sure;
  String musteriYorumu;

  Proje(this.ucret, this.musteriPuani, this.sure, this.musteriYorumu);

  Map<String, dynamic> toMap() {
    return {
      'ucret': ucret,
      'musteriPuani': musteriPuani,
      'sure': sure,
      'musteriYorumu': musteriYorumu,
    };
  }

  factory Proje.fromMap(Map<String, dynamic> map) {
    return Proje(
      map['ucret'],
      map['musteriPuani'],
      map['sure'],
      map['musteriYorumu'],
    );
  }
}
