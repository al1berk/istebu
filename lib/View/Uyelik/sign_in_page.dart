import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:istebu/Model/%C3%BCyelik%20i%C5%9Flemleri/fotograf_ekle.dart';
import 'package:istebu/Model/%C3%BCyelik%20i%C5%9Flemleri/local_depo.dart';
import 'package:istebu/Model/M%C3%BC%C5%9Fteri/musteri.dart';
import 'package:istebu/View/Uyelik/creat_profile.dart';
import 'package:istebu/View/widgets.dart';
import 'package:istebu/ViewModel/create_profile_view_model.dart';
import 'package:uuid/uuid.dart';
import '../../Model/Çalışan/calisan_model.dart';
import 'creat_profile_two.dart';
import 'dart:io';
class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController isimController = TextEditingController();
  final TextEditingController soyisimController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numaraController = TextEditingController();
  bool isChecked = false;
  bool isChecked2 = false;
  CreateProfileViewModel viewModel = CreateProfileViewModel();
  String? _selectedImage;
  File? f ;
  LocalData localData = LocalData();



@override
void initState() {
  super.initState();
  loadSelectedImage();


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Üyelik Ekranı'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: -80,
            bottom: -90,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
              ),
            ),
          ),
          Positioned(
            left: -145,
            bottom: 350,
            child: Transform.rotate(
              angle: -pi * 1.12 / 4,
              child: CustomPaint(
                size: const Size(700, 1),
                painter: SinusWavePainter(),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Column(
                      children: [
                        Stack(children: [
                          ProfilResmiWidget(
                            c: f,


                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: IconButton(
                              onPressed: () => _showImagePickerDialog(context),
                              icon: Icon(
                                Icons.camera_alt,
                                size: 50, // Simgenin boyutunu istediğiniz değerle değiştirin
                              ),
                            )
                          ),
                        ],),

                        Text(
                          "   Profil\nFotoğrafı",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Create\nAccount",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        TextF(
                          hintText: "İsim",
                          controller: isimController,
                          textFieldWidth: 200,
                          borderColor: Colors.green,
                          borderWidth: 3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextF(
                          hintText: "Soyisim",
                          controller: soyisimController,
                          textFieldWidth: 200,
                          borderColor: Colors.green,
                          borderWidth: 3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextF(
                          hintText: "Telefon Numarası",
                          controller: numaraController,
                          textFieldWidth: 200,
                          borderColor: Colors.green,
                          borderWidth: 3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextF(
                          hintText: "E-Posta",
                          controller: emailController,
                          textFieldWidth: 200,
                          borderColor: Colors.green,
                          borderWidth: 3.0,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextF(
                          hintText: "Şifre",
                          controller: passwordController,
                          textFieldWidth: 200,
                          borderColor: Colors.green,
                          borderWidth: 3.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: !isChecked,
                  // control false olduğunda görünür, true olduğunda görünmez
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
                  visible: !isChecked2,
                  // control false olduğunda görünür, true olduğunda görünmez
                  child: Row(
                    children: [
                      const SizedBox(width: 30),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          print(isChecked);
                          setState(() {
                            print(isChecked);
                            isChecked = value ?? false;
                            print(isChecked);
                          });
                          print(isChecked);
                        },
                      ),
                      const Text(
                        'Sadece İşverenim',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isChecked || isChecked2,
                  // Eğer control false ise görünmez, true ise görünür
                  child: EButton(
                    onPressed: () {
                      if (isimController.text.isEmpty ||
                          soyisimController.text.isEmpty ||
                          numaraController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        // Eksik alanları doldurun uyarısı
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return bosUyari();
                          },
                        );
                      } else {
                        // Tüm alanlar doldurulmuş, devam et
                        const uuid = Uuid();
                        String uniqueId = uuid.v4();
                        if (isChecked2) {
                          Calisan c = Calisan(
                            "",
                            0,
                            isimController.text,
                            soyisimController.text,
                            [],
                            "",
                            "",
                            numaraController.text,
                            [],
                            uniqueId,
                          );
                          Get.to(CreateProfileTwo(
                            calisan: c,
                          ));
                        }
                        if (isChecked) {
                          Musteri m = Musteri(
                            isimController.text,
                            soyisimController.text,
                            numaraController.text,
                            "",
                            "",
                            emailController.text,
                            "",
                            [],
                          );

                          Get.to(CreateProfile(musteri: m));
                        }
                      }
                    },
                    buttonText: !isChecked ? "Next" : "Next",
                    color: Colors.purple,
                  ),




                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile.path;
        f = File(pickedFile.path);
        LocalData.saveSelectedImage(pickedFile.path);
        viewModel.uploadPic(pickedFile.path);

      });
    }
  }
  Future<void> _captureImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile.path;
        f = File(pickedFile.path);
        LocalData.saveSelectedImage(pickedFile.path);
        viewModel.uploadPic(pickedFile.path);


      });
    }
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Galeriden Seç'),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Kameradan Çek'),
              onTap: () {
                Navigator.pop(context);
                _captureImage();
              },
            ),
          ],
        );
      },
    );
  }
Future<void> loadSelectedImage() async {
  _selectedImage = await LocalData.getSelectedImage();
  if(_selectedImage != null) {
    if(_selectedImage != null) {
      setState(() {
        f = File(_selectedImage!);
      });

    }
  }
  else {
    print("bostu");
  }

}

}




