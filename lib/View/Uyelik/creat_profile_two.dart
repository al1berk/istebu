import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:istebu/Model/%C3%87al%C4%B1%C5%9Fan/calisan_model.dart';
import 'package:istebu/Model/is_alanlar%C4%B1_model.dart';
import 'package:istebu/View/widgets.dart';
import 'package:istebu/ViewModel/create_profile_view_model.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../Ilanlar/ilanlar.dart';

class CreateProfileTwo extends StatefulWidget {
  Calisan calisan;

  CreateProfileTwo({super.key, required this.calisan});

  @override
  State<CreateProfileTwo> createState() => _CreateProfileTwoState(calisan);
}

class _CreateProfileTwoState extends State<CreateProfileTwo> {
  TextEditingController _universiteController = TextEditingController();
  TextEditingController _ilController = TextEditingController();
  TextEditingController _ilceController = TextEditingController();
  TextEditingController _bolumController = TextEditingController();
  TextEditingController _yovmiyeTekrarController = TextEditingController();
  List<String> secilenAlanlar = [];
  List<String> secilenDallar = [];
  IsAlanlariModel isAlanlariModel = IsAlanlariModel();
  Calisan calisan;

  _CreateProfileTwoState(this.calisan);

  CreateProfileViewModel viewModel = CreateProfileViewModel();

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
          TextF(
            hintText: "İl",
            controller: _ilController,
            borderColor: Colors.green,
            borderWidth: 3,
            textFieldWidth: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextF(
            hintText: "İlçe",
            controller: _ilceController,
            borderColor: Colors.green,
            borderWidth: 3,
            textFieldWidth: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextF(
            hintText: "Üniversite",
            controller: _universiteController,
            borderColor: Colors.green,
            borderWidth: 3,
            textFieldWidth: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextF(
            hintText: "Bölüm",
            controller: _bolumController,
            borderColor: Colors.green,
            borderWidth: 3,
            textFieldWidth: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          TextF(
            hintText: "tahmini saatlik ücret beklentiniz",
            controller: _yovmiyeTekrarController,
            borderColor: Colors.green,
            borderWidth: 3,
            textFieldWidth: 200,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.green, width: 4.0),
              ),
              child: MultiSelectDialogField(
                items: isAlanlariModel
                    .getAlanAdlari()
                    .map((department) =>
                        MultiSelectItem<String>(department, department))
                    .toList(),
                initialValue: secilenAlanlar,
                onConfirm: (values) {
                  setState(() {
                    secilenAlanlar = values;
                  });
                },
                buttonText: Text('Yapabileceğiniz işleri seçiniz'),
                checkColor: Colors.white,
              ),
            ),
          ),
          Visibility(
            visible: secilenAlanlar.isNotEmpty,
            // Eğer control false ise görünmez, true ise görünür
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 40, 40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.green, width: 4.0),
                ),
                child: MultiSelectDialogField(
                  items: isAlanlariModel
                      .getDallar(secilenAlanlar)
                      .map((department) =>
                          MultiSelectItem<String>(department, department))
                      .toList(),
                  initialValue: secilenDallar,
                  onConfirm: (values) {
                    setState(() {
                      secilenDallar = values;
                    });
                  },
                  buttonText: Text('alt dalları seçiniz'),
                  checkColor: Colors.white,
                ),
              ),
            ),
          ),
          EButton(
            onPressed: () {
              if (_ilController.text.isEmpty ||
                  _ilceController.text.isEmpty ||
                  _yovmiyeTekrarController.text.isEmpty ||
                  _bolumController.text.isEmpty ||
                  _universiteController.text.isEmpty) {

                const bosUyari();
              } else {
                calisan.universite = _universiteController.text;
                calisan.bolum = _bolumController.text;
                calisan.saatlikUcret = int.parse(_yovmiyeTekrarController.text);
                calisan.alan = secilenDallar;
                viewModel.addCalisan(calisan);
                Get.offAll(const Ilanlar());
              }
            },
            buttonText: "Bitir",
            color: Colors.purple,
          )
        ],
      )),
    );
  }
}
