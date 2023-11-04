import 'package:flutter/material.dart';

import '../../Model/Çalışan/calisan_model.dart';
import '../widgets.dart';

class Kisi extends StatelessWidget {
  Calisan c ;
  Kisi({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Üyelik Ekranı'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ProfilResmiWidget(c: c.imageUrl),
              SizedBox(height: 15,),
              Text(c.isim),
              SizedBox(height: 15,),
              Text(c.universite),
              SizedBox(height: 15,),
              Text(c.bolum),
              SizedBox(height: 15,),
              Text(c.saatlikUcret.toString()+"TL"),
              SizedBox(height: 15,),
              SizedBox(height: 15,),
              EButton(onPressed: (){}, buttonText: "Mesaj Gönder", color: Colors.purple,)
            ],
          )
      ),
    );
  }
}