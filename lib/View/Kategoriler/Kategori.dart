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
  List<Color> colors = [Colors.green,Colors.deepPurple,Colors.pink,Colors.red,Colors.yellow,Colors.black];
  

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
            return Card(
              elevation: 4, // Card'ın gölgesi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0), // Yuvarlak kenar
                side: BorderSide(width: 5, color: Colors.blue), // Kenarlık ayarı
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: Container(
                  width: 25.0,
                  height: 100.0,
                  color: colors[index],
                ),
                title: Text(item),
                onTap: () async {
                  List<Calisan> calisanlar = await CreateProfileViewModel().getCalisanlar(item);
                  Get.to(Kisiler(title: item, calisanlar: calisanlar,));
                },
              ),
            );
          },
        )


    );
  }
}



