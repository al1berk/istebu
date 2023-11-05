import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istebu/Model/%C3%BCyelik%20i%C5%9Flemleri/local_depo.dart';
import 'package:istebu/ViewModel/create_profile_view_model.dart';

import 'package:flutter/material.dart';
import 'package:istebu/ViewModel/profil_view_model.dart';

class ProfilCenteredContent extends StatefulWidget {
  @override
  _ProfilCenteredContentState createState() => _ProfilCenteredContentState();
}

class _ProfilCenteredContentState extends State<ProfilCenteredContent> {
ProfilViewModel viewModel = ProfilViewModel();
String? i ;
  @override
  void initState() {
    super.initState();
    getID();
   getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Widget>(
            future: _getContent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Hata oluştu: ${snapshot.error}');
              } else {
                return snapshot.data!;
              }
            },
          ),
        ],
      ),
    );
  }

  Future<Widget> _getContent() async {
    String path = await LocalData.getSelectedImage() ?? "";
    print(path);
    String id = await getID();
    print("çekilen_fotograflar/$id");
    String? imageUrl =
    await CreateProfileViewModel().getImageUrl("çekilen_fotograflar/$id");

    if (imageUrl != null) {
      return FadeInImage(
        placeholder: AssetImage('assets/placeholder_image.png'), // Placeholder resmi
        image: NetworkImage(imageUrl),
        width: 200,
        height: 200,
      );
    } else {
      // Resim yüklenemediyse
      return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 100,
        ),
      );
    }
  }

  Future<String> getID() async {
    String? id = await LocalData.getUid();
    print(id);
    i = id;
    print("i"+i!);
    return id!;
  }
  getData() async {
    if(getID() != null) {
      print("ife girdi");
      String tempID =await getID();
      viewModel.getIsverenlerData(tempID);
    }
  }
}


