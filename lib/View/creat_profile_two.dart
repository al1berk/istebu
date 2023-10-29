import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:istebu/View/widgets.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import 'ilanlar.dart';

class CreateProfileTwo extends StatefulWidget {
  const CreateProfileTwo({super.key});

  @override
  State<CreateProfileTwo> createState() => _CreateProfileTwoState();
}

class _CreateProfileTwoState extends State<CreateProfileTwo> {
  TextEditingController _universiteController = TextEditingController();
  TextEditingController _bolumController = TextEditingController();
  TextEditingController _yovmiyeTekrarController = TextEditingController();
  List<String> selectedDepartments = []; // Seçilen bölümleri tutacak liste
  List<String> departmentList = ['Web sitesi', 'Mobil Uygulama', 'Bölüm 3', 'Bölüm 4'];


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
              TextF(hintText: "Üniversite", controller: _universiteController),
              const SizedBox(height: 20,),
              TextF(hintText: "Bölüm", controller: _bolumController),
              const SizedBox(height: 30,),
              TextF(hintText: "tahmini saatlik ücret beklentiniz", controller: _yovmiyeTekrarController),
              Padding(
                padding: EdgeInsets.all(40.0), // Tüm kenarlardan 30 padding ekler
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: MultiSelectDialogField(
                    items: departmentList
                        .map((department) => MultiSelectItem<String>(department, department))
                        .toList(),
                    initialValue: selectedDepartments,
                    onConfirm: (values) {
                      setState(() {
                        selectedDepartments = values;
                      });
                    },
                    buttonText: Text('Yapabileceğiniz işleri seçiniz'),
                  ),
                ),
              ),
              EButton(onPressed: (){
                Get.offAll(
                    const Ilanlar()
                );

              }, buttonText: "Bitir")





            ],
          )
      ),
    );
  }
}