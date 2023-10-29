import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../ViewModel/kategori_view_model.dart';
import 'kisiler.dart';

class Kategori extends StatelessWidget {
  String title ;
  final List<KategoriItem> items = [
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
    KategoriItem(title: "Mobil Uygulama geliştirme", imageUrl: "assets/image.png"),
    KategoriItem(title: "Web Sitesi Geliştirme", imageUrl: "assets/asd.jpeg"),
  ];

  Kategori({super.key, required this.title});
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
                  backgroundImage: AssetImage(item.imageUrl),
                ),
                title: Text(item.title),
                onTap: () {
                  Get.to(Kisiler(title: item.title));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}



