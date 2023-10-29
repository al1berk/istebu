import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextF({
    super.key,
    required this.hintText,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 40,right: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), // Köşeleri yuvarlatan kısım
          ),
        ),
      ),
    );
  }
}
class EButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  EButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // Arkaplan rengi
        onPrimary: Colors.white, // Metin rengi
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Yuvarlatılmış köşeler
        ),
      ),
      child: Text(buttonText),
    );
  }
}
class ProfilResmiWidget extends StatelessWidget {
  const ProfilResmiWidget({
    super.key,
    required this.c,
  });

  final String c;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Genişlik
      height: 150, // Yükseklik
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // Yuvarlak şekil
        color: Colors.blue, // Daire rengi
      ),
      child: ClipOval(
        child: c != null
            ? Image.asset(
          'assets/asd.jpeg', // Profil resminin yolunu belirtin
          width: 150, // Genişlik
          height: 150, // Yükseklik
          fit: BoxFit.cover, // İmajın boyutunu ayarlar
        )
            : const Icon(
          Icons.person, // Daire içinde gösterilecek simge
          size: 80, // Simge boyutu
          color: Colors.white, // Simge rengi
        ),
      ),
    );
  }
}