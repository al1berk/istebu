class IsAlanlariModel {
  Map<String,List<String>> alanlar = {
    'Yazılım' : ["Yapay Zeka","Mobil Uygulama","Web Sitesi","Oyun Programlama"],
    'Grafik Tasarım': ["Web Tasarım","Mobil Tasarım","Dergi Tasarım"],
    'Seslendirme': ["Dublaj","Reklam Seslendirme","Dizi/Film","Şiir"],
    'Temizlik': ["Ev Temizliği",'Dükkan Temizliği']
  };
  List<String> getAlanAdlari() {
    return alanlar.keys.toList();
  }
  List<String> getDallar(List<String> secilenAlanlar){
    List<String> dallar = [];
    for (String alan in secilenAlanlar){
      dallar.addAll(alanlar[alan] as Iterable<String>);
    }
    return dallar;
  }


  }

