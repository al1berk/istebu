import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istebu/Model/is_alanlar%C4%B1_model.dart';
import 'kategori.dart';

class KategorilerCenteredContent extends StatelessWidget {
  IsAlanlariModel isAlanlariModel = IsAlanlariModel();
  final List<String> imagePaths = ["assets/Unknown.jpeg"];

  KategorilerCenteredContent({super.key});

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(

        children: [

      Positioned(
        top: 0,
        left: sWidth*0.8,
        child: Container(
          width: 275.0*sWidth*0.8/314, // Daire genişliği
          height: 275.0*sWidth*0.8/314, // Daire yüksekliği
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange, // Daire rengi
          ),
        ),
      ),
          Positioned(
            top: sHeight*0.5,
            left: sWidth*0.8,
            child: Container(
              width: 275.0*sWidth*0.8/314, // Daire genişliği
              height: 275.0*sWidth*0.8/314, // Daire yüksekliği
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange, // Daire rengi
              ),
            ),
          ),
          Positioned(
            top: sHeight*0.5,
            left: sWidth*-0.51,
            child: Container(
              width: 275.0*sWidth*0.8/314, // Daire genişliği
              height: 275.0*sWidth*0.8/314,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange, // Daire rengi
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: sWidth*-0.51,
            child: Container(
              width: 275.0*sWidth*0.8/314, // Daire genişliği
              height: 275.0*sWidth*0.8/314, // Daire yüksekliği
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange, // Daire rengi
              ),
            ),
          ),

         Padding(padding: EdgeInsets.only(left: 15,right: 15),
           child:GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
             ),
             itemCount: 4,
             itemBuilder: (BuildContext context, int index) {
               return GestureDetector(
                 onTap: () {
                   Get.to(Kategori(
                       title: isAlanlariModel.getAlanAdlari()[index],
                       items: isAlanlariModel
                           .alanlar[isAlanlariModel.getAlanAdlari()[index]]!));
                   print('Tıklanan öğe indexi: ${MediaQuery.of(context).size.width*0.8}index');
                 },
                 child: Stack(

                   children: [
                     Padding(padding: const EdgeInsets.only(top: 5),
                       child: Stack(
                         children: [




                           Container(
                             margin: EdgeInsets.all(8.0),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(200),
                               child: Image.asset(
                                 imagePaths[0],
                                 width: 200,
                                 height: 200,
                               ),
                             ),
                           ),
                           Positioned.fill(
                             child: Container(
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(
                                   color: Colors.blue,
                                   width: 4.0,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),

                     Positioned.fill(
                       child: Center(
                         child: Container(
                           color: Colors.white.withOpacity(0.9),
                           padding: EdgeInsets.all(4.0),
                           child: Text(
                             isAlanlariModel.getAlanAdlari()[index],
                             style: TextStyle(color: Colors.blue),
                           ),
                         ),
                       ),
                     ),
                   ],


                 ),

               );
             },
           ) ,
         ),
           // Diğer Stack çocukları
        ],
      )


    );
  }
}

class HalfCirclePainter extends CustomPainter {
  Color color;
  HalfCirclePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {


    final paint = Paint()
      ..color = color // Yarım dairenin rengini ayarlayın
      ..style = PaintingStyle.fill; // Dolum stili
    final center = Offset(size.width / 2, size.height); // Yarım dairenin merkezi
    final radius = size.width / 2; // Yarım dairenin yarıçapı

    // Yarım daireyi çizin
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.7,
      -3.141592653589793, // Pi sayısı ile çarpılmış negatif açı, yarım daireyi çizer
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

