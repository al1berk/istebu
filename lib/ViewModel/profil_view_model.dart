import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilViewModel {
  Future<void> getIsverenlerData(String doc) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      String collectionName = 'isverenler';
      String documentName = doc;
      DocumentSnapshot documentSnapshot = await firestore
          .collection(collectionName)
          .doc(documentName)
          .get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      print("Data: $data");
    } catch (e) {
      print("Hata: $e");
    }
  }
}