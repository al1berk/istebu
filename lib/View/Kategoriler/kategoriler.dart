import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istebu/Model/is_alanlar%C4%B1_model.dart';
import 'kategori.dart';

class KategorilerCenteredContent extends StatelessWidget {
  IsAlanlariModel isAlanlariModel = IsAlanlariModel();
  final List<String> imagePaths = [
    'assets/image.png',
    'assets/asd.jpeg',
    'assets/image.png',
    'assets/asd.jpeg'
  ];

  KategorilerCenteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {

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
                      isAlanlariModel.getAlanAdlari()[index],
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
