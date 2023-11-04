import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<void> saveUid(String uid) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid);
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
    }
  }

  static Future<String?> getUid() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('uid');
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
      return null; // veya başka bir değer döndürebilirsiniz
    }
  }

  static Future<void> saveIsim(String isim) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('isim', isim);
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
    }
  }

  static Future<String?> getIsim() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('isim');
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
      return null;
    }
  }


  static Future<void> saveSoyisim(String soyisim) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('soyisim', soyisim);
  }

  static Future<String?> getSoyisim() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('soyisim');
  }

  static Future<void> saveEPosta(String ePosta) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ePosta', ePosta);
  }

  static Future<String?> getEPosta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ePosta');
  }

  static Future<void> saveNumara(String numara) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('numara', numara);
  }

  static Future<String?> getNumara() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('numara');
  }

  static Future<void> saveAlanlar(List<String> alanlar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('alanlar', alanlar);
  }

  static Future<List<String>> getAlanlar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('alanlar') ?? [];
  }
  static Future<void> saveSelectedImage(String selectedImage) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedImage', selectedImage);
      print("yazma başarılı");
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
    }
  }
  static Future<String?> getSelectedImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("çekme başarılı");

      return prefs.getString('selectedImage');
    } catch (e) {
      print('Hata oluştu: $e');

      // Hata durumuyla başa çıkma veya kullanıcıya bilgi verme
      return null;
    }
  }


// ...
}


