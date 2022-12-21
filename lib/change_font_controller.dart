import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontsController extends GetxController {
  initFonts() async {
    final prefs = await SharedPreferences.getInstance();
    fontData = prefs.getString('fonts') ?? 'KhmerOS_sys'.obs();
    update();
  }

  List? fontDataList = ['Poppin', 'Quicksand', 'Roboto'].obs();
  String? fontData;
  changeFonts(int fontIndex) async {
    final prefs = await SharedPreferences.getInstance();
    fontData = fontDataList![fontIndex];
    await prefs.setString('fonts', fontData!);
    update();
  }

}


