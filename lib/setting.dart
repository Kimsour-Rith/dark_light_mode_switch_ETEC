import 'package:dark_light_mode_switch/local_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}
SwitchLanguageController switchLanguageController = Get.put(SwitchLanguageController());
class _SettingState extends State<Setting> {
  final appdata = GetStorage();
  bool isSwitch = false;

  void toggleSwitch(bool value) {
    if (isSwitch == false) {
      setState(() {
        isSwitch = !isSwitch;
        
        // var locale = Locale('mkh');
        // Get.updateLocale(locale);
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull('darkmode', false);
    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appdata.read('darkmode');
        return Scaffold(
          appBar: AppBar(title: Text("setting".tr)),
          body: Column(
            children: [
              ListTile(
                leading: Icon(isDarkMode ? Icons.nightlight : Icons.sunny),
                title: Text(isDarkMode ? 'darkmode'.tr : 'lightmode'.tr),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) => appdata.write('darkmode', value),
                ),
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text("language".tr),
                trailing: Switch(
                  value: isSwitch, 
                  onChanged: toggleSwitch
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.fingerprint),
                title: Text("loginwith".tr),
             
              )
            ],
          ),
        );
      },
    );
  }
}
