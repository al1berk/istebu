import 'dart:math';

import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Color borderColor;
  final double borderWidth;
  final double textFieldWidth;

  const TextF({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.borderColor,
    required this.borderWidth,
    required this.textFieldWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2),
      child: Container(
        width: textFieldWidth, // Set the width of the TextField here
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color; // Yeni parametre: düğmenin rengi

  EButton({
    required this.onPressed,
    required this.buttonText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color, // Arkaplan rengi
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

  final String? c;

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

class SinusWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final path = Path();
    final amplitude = 20; // Dalga yüksekliği
    final frequency = 0.02; // Dalga frekansı
    final yOffset = size.height / 2;

    path.moveTo(0, yOffset);

    for (double x = 0; x <= size.width; x += 5) {
      final y = yOffset - amplitude * sin(frequency * x);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8);

    final firstControlPoint =
    Offset(size.width * 0.15, size.height); // Adjust this value
    final firstEndPoint = Offset(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondControlPoint =
    Offset(size.width * 0.85, size.height * 0.6); // Adjust this value
    final secondEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class bosUyari extends StatelessWidget {
  const bosUyari({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Uyarı'),
      content: Text('Lütfen bütün alanları doldurun!'),
      actions: <Widget>[
        TextButton(
          child: Text('Kapat'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}