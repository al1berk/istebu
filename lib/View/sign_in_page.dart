import 'dart:math';

import 'package:flutter/material.dart';
import 'package:istebu/View/widgets.dart';





class SigninPage extends StatelessWidget {
  const SigninPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController isimController = TextEditingController();
    final TextEditingController soyisimController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordTekrarController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Üyelik Ekranı'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: -80, // Ayarlayabilirsiniz
            bottom:-90, // Ayarlayabilirsiniz
            child: Container(
              width: 200, // Ayarlayabilirsiniz
              height: 200, // Ayarlayabilirsiniz
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple, // Mor renk
              ),
            ),
          ),
          Positioned(
            left: -145,
            bottom: 350,
            child: Transform.rotate(
              angle: -pi*1.12 / 4,
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
                    const Column(

                      children: [

                        ProfilResmiWidget(c: null,),

                        Text(
                          "   Profil\nFotoğrafı",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 50,)
                        ,
                        Text(
                          "Create\nAccount",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                          ),
                        ),
                        SizedBox(height: 200,)

                      ],),
                    SizedBox(width: 30,),

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
                        const SizedBox(
                          height: 16,
                        ),
                        EButton(
                          onPressed: () {},
                          buttonText: "Sign in",
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}