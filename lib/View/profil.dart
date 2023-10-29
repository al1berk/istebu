import 'package:flutter/cupertino.dart';

class ProfilCenteredContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Profil page"),
          // İçerik eklemek istediğiniz diğer öğeleri buraya ekleyebilirsiniz
        ],
      ),
    );
  }
}