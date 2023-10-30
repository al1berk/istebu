import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istebu/View/widgets.dart';
import '../../Model/Müşteri/musteri.dart';
import '../../ViewModel/create_profile_view_model.dart';
import 'creat_profile_two.dart';
import '../ilanlar.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({super.key,required this.musteri});
  Musteri musteri;

  @override
  State<CreateProfile> createState() => _CreateProfileState(musteri);
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController _ilController = TextEditingController();
  TextEditingController _ilceController = TextEditingController();
  CreateProfileViewModel viewModel = CreateProfileViewModel();

  Musteri musteri;
  _CreateProfileState(this.musteri);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profil Oluştur'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextF(hintText: "İl", controller: _ilController, borderColor: Colors.green, borderWidth: 3, textFieldWidth: 200,),
              const SizedBox(height: 20,),
              TextF(hintText: "İlçe", controller: _ilceController, borderColor: Colors.green, borderWidth: 3, textFieldWidth: 200,),
              const SizedBox(height: 20,),
              EButton(onPressed: (){
                musteri.il = _ilController.text;
                musteri.ilce = _ilceController.text;
                viewModel.addMusteri(musteri);

                Get.offAll(
                    const Ilanlar()
                );

              }, buttonText: "Sign In", color: Colors.purple,

              )
            ],
          )
      ),
    );
  }
}



