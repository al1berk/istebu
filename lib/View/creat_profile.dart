import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:istebu/View/widgets.dart';

import 'creat_profile_two.dart';
import 'ilanlar.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController _isimController = TextEditingController();
  TextEditingController _soyisimController = TextEditingController();
  TextEditingController _passwordTekrarController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final String defaultImagePath = 'assets/default_profile.jpg'; // Varsayılan profil resmi
  String? selectedImagePath;
  bool isChecked= false;
  bool isChecked2= false;





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
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text('Profil Resmini Güncelle'),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            child: Text('Galeriden Seç'),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            child: Text('Kamerayı Kullan'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: selectedImagePath != null
                      ? AssetImage(selectedImagePath!)
                      : AssetImage(defaultImagePath),
                ),
              ),
              SizedBox(height: 30,),
              TextF(hintText: "İsim", controller: _isimController, borderColor: Colors.black, borderWidth: 2, textFieldWidth: 100,),
              SizedBox(height: 12,),
              TextF(hintText: "Soyisim", controller: _soyisimController, borderColor: Colors.black, borderWidth: 2, textFieldWidth: 100,),
              SizedBox(height: 12,),
              Visibility(
                visible: !isChecked, // control false olduğunda görünür, true olduğunda görünmez
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Checkbox(
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Öğrenciyim/Çalışmak istiyorum',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !isChecked2, // control false olduğunda görünür, true olduğunda görünmez
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Sadece İşverenim',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: isChecked||isChecked2, // Eğer control false ise görünmez, true ise görünür
                child: EButton(
                  onPressed: () {
                    if (isChecked2){
                      Get.to(const CreateProfileTwo());
                    }
                    if(isChecked){
                      Get.offAll(Ilanlar());

                    }
                  },
                  buttonText: !isChecked ? "Devam" : "Bitir",
                ),
              )
            ],
          )
      ),
    );
  }
  Future<ImageProvider> loadImage(String path) async {
    try {
      await AssetImage(path).resolve(ImageConfiguration.empty);
      return AssetImage(path);
    } catch (e) {
      return const AssetImage('assets/default_profile.jpg');
    }
  }
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        selectedImagePath = pickedFile.path;
      });
    }
  }
}