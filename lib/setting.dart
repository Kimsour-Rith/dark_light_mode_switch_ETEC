import 'package:dark_light_mode_switch/change_font_controller.dart';
import 'package:dark_light_mode_switch/fontlist.dart';
import 'package:dark_light_mode_switch/local_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final SwitchLanguageController _switchLanguageController =Get.put(SwitchLanguageController());
  FontsController fontsController = Get.put(FontsController());
  @override
  void initState() {
    super.initState();
    switchs = _switchLanguageController.english;
  }

  bool switchs = false;
  final appdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    return GetBuilder<FontsController>(
        init: fontsController,
        builder: (fontcontext) {
          return GetBuilder<SwitchLanguageController>(
              init: _switchLanguageController,
              builder: (switchContext) {
                return SimpleBuilder(
                  builder: (_) {
                    bool isDarkMode = appdata.read('darkmode');
                    return Scaffold(
                      appBar: AppBar(
                          title: Text("setting".tr,
                              style: TextStyle(
                                  fontFamily: fontsController.fontData))),
                      body: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                                isDarkMode ? Icons.nightlight : Icons.sunny),
                            title: Text(
                              isDarkMode ? 'darkmode'.tr : 'lightmode'.tr,
                              style: TextStyle(
                                  fontFamily: fontsController.fontData),
                            ),
                            trailing: Switch(
                              value: isDarkMode,
                              onChanged: (value) =>
                                  appdata.write('darkmode', value),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                              leading: const Icon(Icons.language),
                              title: Text("language".tr,
                                  style: TextStyle(
                                      fontFamily: fontsController.fontData)),
                              trailing: Switch(
                                  value: _switchLanguageController.english,
                                  onChanged: ((value) {
                                    setState(() {
                                      var localEng = const Locale('en', 'US');
                                      var localKh = const Locale('KH', 'KH');
                                      _switchLanguageController
                                          .switchLanguage(value);
                                      Get.updateLocale(
                                          value ? localEng : localKh);
                                    });
                                  }))),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.fingerprint),
                            title: Text("loginwith".tr,
                                style: TextStyle(
                                    fontFamily: fontsController.fontData)),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.font_download),
                            title: Text("font".tr,
                                style: TextStyle(
                                    fontFamily: fontsController.fontData)),
                            trailing: IconButton(
                                onPressed: () {
                                  Get.to(() => FontList());
                                },
                                icon: Icon(Icons.forward)),
                          )
                        ],
                      ),
                    );
                  },
                );
              });
        });
  }
}
