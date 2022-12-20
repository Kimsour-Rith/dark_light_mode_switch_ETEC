import 'package:dark_light_mode_switch/local_string.dart';
import 'package:dark_light_mode_switch/setting.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await switchLanguageController.initLanguage();
  await GetStorage.init(); // before building the app  you need to initialize GetStorage
  runApp(MyApp());
}

SwitchLanguageController switchLanguageController = Get.put(SwitchLanguageController());


class MyApp extends StatelessWidget {
  final appdata = GetStorage(); // instance of GetStorage
  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appdata.read('darkmode');
        return GetMaterialApp(
          locale: switchLanguageController.english
          ? const Locale('en', 'US')
          : const Locale('KH','KH'),
          translations: LocalString(),
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: Text("appbars".tr),
            ),
            drawer: Drawer(
              child: ListView(
      
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('drawers'.tr),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                    ),
                    title: Text('home'.tr),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                 
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: Text('setting'.tr),
                    onTap: () {
                      Get.to(Setting());
                      Navigator.pop(context);
                    }, 
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Text("messages".tr)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
