import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/calisan_model.dart';
import 'kisi.dart';

class Kisiler extends StatelessWidget {
  String title ;
  Kisiler({super.key , required this.title});
  List<Calisan> calisanlar = [
    Calisan("assets/asd.jpeg", 50, "Ahmet",["Mobil Uygulama"],"Bilgisayar mühendisi","ODTÜ"),
    Calisan("assets/asd.jpeg", 50, "Mehmet",["Mobil Uygulama"],"Bilgisayar mühendisi","İTÜ"),
    Calisan("assets/asd.jpeg", 100, "Ali",["Mobil Uygulama"],"Bilgisayar mühendisi","AKDÜ"),
    Calisan("assets/asd.jpeg", 150, "Berk",["Mobil Uygulama"],"Bilgisayar mühendisi","AKDÜ"),
    Calisan("assets/asd.jpeg", 200, "Zehra",["Mobil Uygulama"],"Bilgisayar mühendisi","AKDÜ"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: calisanlar.length,
        itemBuilder: (BuildContext context, int index) {
          final item = calisanlar[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4, // Card'ın gölgesi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Yuvarlak kenar
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(item.imageUrl),
                ),
                title: Text("${item.isim}\nSaat ${item.saatlikUcret}TL"),

                onTap: () {
                  Get.to(Kisi(c: item));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
