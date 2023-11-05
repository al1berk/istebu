import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Model/Müşteri/ilan.dart';

class   IlanOlusturViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addIlan(Ilan ilan) async {
    CollectionReference ilanCollection = firestore.collection("ilanlar");
    Map<String,dynamic> ilanData = ilan.toMap();
    await ilanCollection
        .doc("${ilan.baslik} ${ilan.ilanID} ")
        .set(ilanData);
  }

}