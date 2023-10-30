import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/Çalışan/calisan_model.dart';
import 'kisi.dart';

class Kisiler extends StatelessWidget {
  String title ;
  Kisiler({super.key , required this.title, required this.calisanlar});
  List<Calisan> calisanlar ;

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
