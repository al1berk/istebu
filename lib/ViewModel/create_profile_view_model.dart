import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:istebu/Model/M%C3%BC%C5%9Fteri/musteri.dart';
import '../Model/Çalışan/calisan_model.dart';

class CreateProfileViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addCalisan(Calisan calisan) async {
    for (String alan in calisan.alan) {
      CollectionReference alanCollection = firestore.collection(alan);
      Map<String, dynamic> calisanData = calisan.toMap();
      await alanCollection
          .doc("${calisan.isim} ${calisan.soyisim} ${calisan.id}")
          .set(calisanData);
    }
  }

  Future<void> addMusteri(Musteri musteri) async {
    CollectionReference musteriCollection = firestore.collection("isverenler");
    Map<String,dynamic> musteriData = musteri.toMap();
    await musteriCollection
        .doc("${musteri.isim} ${musteri.soyisim} ${musteri.id}")
        .set(musteriData);

  }

  Future<List<Calisan>> getCalisanlar(String collectionName) async {
    List<Calisan> calisanlar = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    for (QueryDocumentSnapshot document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      Calisan calisan = Calisan.fromMap(data);
      calisanlar.add(calisan);
    }

    return calisanlar;
  }
}
