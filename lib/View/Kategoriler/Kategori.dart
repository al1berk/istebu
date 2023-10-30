import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/is_alanları_model.dart';
import '../../Model/Çalışan/calisan_model.dart';
import '../../ViewModel/create_profile_view_model.dart';
import 'kisiler.dart';

class Kategori extends StatelessWidget {
  String title ;
  final List<String> items;
  

  Kategori({super.key, required this.title,required this.items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4, // Card'ın gölgesi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Yuvarlak kenar
              ),
              child: ListTile(
                leading: CircleAvatar(
                ),
                title: Text(item),
                onTap: () async {
                  List<Calisan> calisanlar = await CreateProfileViewModel().getCalisanlar(item);

                  Get.to(Kisiler(title: item, calisanlar: calisanlar,));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}



