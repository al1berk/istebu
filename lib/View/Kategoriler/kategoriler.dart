import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'kategori.dart';

class KategorilerCenteredContent extends StatelessWidget {
  final List<String> imagePaths = ['assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg','assets/image.png','assets/asd.jpeg'];
  final List<String> kategoriAdlari = ["1. Kategori","Yazılım","3. Kategori","4. Kategori","5. Kategori","6. Kategori","7. Kategori","8. Kategori","9. Kategori","10. Kategori","11. Kategori","12. Kategori","13. Kategori","14. Kategori","15. Kategori","16. Kategori","17. Kategori","18. Kategori","19. Kategori","20. Kategori"];
  KategorilerCenteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Her satırda 2 resim
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(Kategori(title: kategoriAdlari[index]));
              print('Tıklanan öğe indexi: $index');
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Image.asset(imagePaths[index]),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      kategoriAdlari[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
