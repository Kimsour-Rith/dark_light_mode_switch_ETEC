
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  // TODO: implement key
  Map<String, Map<String, String>> get keys => {
    'en':{
      'main_text' : 'Language Translation App',
      'profile' : "Profile",
      'messages' : "This Is First Page",
      'home' : "Home",
      'setting' : "Setting",
      'darkmode' : "Dark Mode",
      'lightmode' : "Light Mode",
      'language' : "Khmer / English",
      'loginwith' : "Login With FingerPrint",
      'font' : "Fonts"
    },
    'KH' : {
      'main_text' : 'កម្មវិធីបកប្រែភាសា',
      'profile' : "ប្រវត្តិរូប",
      'messages' : "នេះជាទំព័រដំបូង",
      'home' : "ហូម",
      'setting' : "ការកំណត់",
      'darkmode' : "ងងឹត",
      'lightmode' : "ពន្លឺ",
      'language' : "ខ្មែរ/អង់គ្លេស",
      'loginwith' : "ចូលដោយប្រើស្នាមម្រាមដៃ",
      'font' : "ម៉ូតអក្សរ"
    }
  };
}

class SwitchLanguageController extends GetxController {
  bool english = false.obs();
  initLanguage() async {
    var prefs = await SharedPreferences.getInstance();

    english = prefs.getBool('engCode') ?? false.obs();
    update();
    return english;
  }

  switchLanguage(bool eng) async {
    print(eng);
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('engCode', eng);
    english = prefs.getBool('engCode') ?? false.obs();
    print(english);
    update();
  }
}
