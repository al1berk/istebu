import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:istebu/View/sign_in_page.dart';
import 'package:istebu/View/widgets.dart';

import 'creat_profile.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Giriş Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextF(hintText: "E-Posta Adresi", controller: _emailController,),
              const SizedBox(height: 10,),
              TextF(hintText: "Şifre", controller: _passwordController,),
              Row(
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
                    'Beni Hatırla',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              EButton(
                onPressed: () {
                  print("E-Posta Adresi: ${_emailController.text}");
                  print("Şifre: ${_passwordController.text}");
                  Get.to(CreateProfile());
                },
                buttonText: "Giriş",
              ),
              SizedBox(height: 60,),
              GestureDetector(
                onTap: () {
                  print("google ile üye ola basıldı");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(width: 2.0),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        BoxIcons.bxl_google,
                        size: 48,
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Google ile Giriş Yap',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Üye Değil misiniz ?"),
                  TextButton(
                    onPressed: () {
                      print("Üye Ol butonuna basıldı");
                      Get.to(SigninPage());
                    },
                    child: Text("Üye Ol"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


