import 'package:flutter/material.dart';
import 'package:istebu/View/widgets.dart';





class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordTekrarController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Üyelik Ekranı'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextF(hintText: "E-Posta", controller: _emailController),
              SizedBox(height: 16,),
              TextF(hintText: "Şifre", controller: _passwordController),
              SizedBox(height: 16,),
              TextF(hintText: "Şifre Tekrar", controller: _passwordTekrarController),
              SizedBox(height: 16,),
              EButton(onPressed: (){}, buttonText: "Üye Ol")
            ],
          )
      ),
    );
  }
}