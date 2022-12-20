
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  // TODO: implement key
  Map<String, Map<String, String>> get keys => {
    'en':{
      'appbars' : 'Language translation app',
      'drawers' : "Profile",
      'messages' : "This is first page",
      'home' : "Home",
      'setting' : "Setting",
      'darkmode' : "Dark Mode",
      'lightmode' : "Light Mode",
      'language' : "Khmer / English",
      'loginwith' : "Login With FingerPrint"
    },
    'KH' : {
      'appbar' : 'កម្មវិធីបកប្រែភាសា',
      'drawer' : "ប្រវត្តិរូប",
      'message' : "នេះជាទំព័រដំបូង",
      'home' : "ផ្ទះ",
      'setting' : "ការកំណត់",
      'darkmode' : "របៀបងងឹត",
      'lightmode' : "របៀបពន្លឺ",
      'language' : "ខ្មែរ/អង់គ្លេស",
      'loginwith' : "ចូលដោយប្រើស្នាមម្រាមដៃ"
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
