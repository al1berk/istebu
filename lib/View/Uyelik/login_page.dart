import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:istebu/Model/%C3%BCyelik%20i%C5%9Flemleri/eposta.dart';
import 'package:istebu/View/ilanlar.dart';
import 'package:istebu/View/Uyelik/sign_in_page.dart';
import 'package:istebu/View/widgets.dart';

import 'creat_profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
          body: Stack(
            children: [
              Positioned(
                left: -100, // Move to the left
                top: -66, // Move to the top
                child: Transform.rotate(
                  angle: -25 * 3.14159265359 / 180,
                  // Rotate 45 degrees to the left
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.orange,
                      height: 200,
                      width: 400,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -70, // Adjust the top position for the circle
                right: -70, // Adjust the right position for the circle
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -86, // Move to the bottom
                right: -60, // Move to the right
                child: Transform.rotate(
                  angle: 160 * 3.14159265359 / 180,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.orange,
                      height: 200,
                      width: 400,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // Align content to the right horizontally
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // Center content vertically
                          children: [
                            TextF(
                              hintText: "E-Posta",
                              controller: _emailController,
                              textFieldWidth: 240,
                              borderColor: Colors.green,
                              borderWidth: 4.0,
                            ),
                            const SizedBox(height: 20),
                            TextF(
                              hintText: "şifre",
                              controller: _passwordController,
                              textFieldWidth: 240,
                              borderColor: Colors.green,
                              borderWidth: 4.0,
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
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
                              onPressed: () async {
                                if(await signInOrRegister(_emailController.text, _passwordController.text)){
                                  Get.offAll(const Ilanlar());
                                }
                                else{

                                  }

                              },
                              buttonText: "Giriş yap",
                              color: Colors.purple,
                            ),
                            const Text(
                              "Or",
                              style: TextStyle(
                                fontSize:
                                    20, // Set the font size to your desired value
                              ),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // Set the shape to circle
                                    border: Border.all(width: 0.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    // Adjust the padding as needed
                                    child: Icon(
                                      BoxIcons.bxl_google,
                                      size: 48,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  Text("Üye Değil misiniz ?"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(const SigninPage());
                                    },
                                    child: const Text("Üye Ol"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              "Let's",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.green),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Get",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.green),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Started",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.green),
                            ),
                            SizedBox(
                              height: 200,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
