import 'package:flutter/material.dart';
import 'package:istebu/View/profil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Kategoriler/kategoriler.dart';

class Ilanlar extends StatefulWidget {
  const Ilanlar({super.key});

  @override
  State<Ilanlar> createState() => _IlanlarState();
}

class _IlanlarState extends State<Ilanlar> {

  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(baslik(_currentIndex)),
      ),
      body: _buildContentForIndex(_currentIndex),
      bottomNavigationBar:SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
          if (i == 0) {

          }
          else if (i == 2){
          }
        }

        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Kategoriler"),
            selectedColor: Colors.purple,
          ),


          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("İlanlar"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );

  }
}

class IlanlarCenteredContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ilanlar page"),
          // İçerik eklemek istediğiniz diğer öğeleri buraya ekleyebilirsiniz
        ],
      ),
    );
  }
}
Widget _buildContentForIndex(int index) {
  switch (index) {
    case 0:
      return KategorilerCenteredContent();
    case 1:
      return IlanlarCenteredContent();
    case 2:
      return ProfilCenteredContent();
    default:
      return Container(); // Varsayılan durum
  }
}

String baslik(int index)  {
  switch(index){
    case 0:
      return "Kategoriler";
    case 1:
      return "İlanlar";
    case 2:
      return "Profil";
    default:
      return "";
  }
}
