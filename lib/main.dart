import 'package:dark_light_mode_switch/change_font_controller.dart';
import 'package:dark_light_mode_switch/local_string.dart';
import 'package:dark_light_mode_switch/setting.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await switchLanguageController.initLanguage();
  await GetStorage
      .init(); // before building the app  you need to initialize GetStorage
  runApp(MyApp());
}

FontsController fontsController = Get.put(FontsController());
SwitchLanguageController switchLanguageController =
    Get.put(SwitchLanguageController());

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
              : const Locale('KH', 'KH'),
          translations: LocalString(),
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
        );
      },
    );
    }
    
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchs = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(
      init: fontsController,
      builder: (fontcontext) {
        return Scaffold(
          appBar: AppBar(
            title: Text("main_text".tr,style: TextStyle(fontFamily: fontsController.fontData)),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('profile'.tr, style: TextStyle(fontFamily: fontsController.fontData),),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: Text('home'.tr,style: TextStyle(fontFamily: fontsController.fontData)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: Text('setting'.tr,style: TextStyle(fontFamily: fontsController.fontData)),
                  onTap: () {
                    Get.to(() => const Setting());
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Text("messages".tr,style: TextStyle(fontFamily: fontsController.fontData)),
                
              ],
            ),
          ),
        );
      }
    );
  }
}
