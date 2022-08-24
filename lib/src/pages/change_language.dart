import 'package:demo_app/src/central/widgets/my_show_toast.dart';

import '../central/language_controller.dart';
import '../central/widgets/my_btn.dart';
import '../central/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../central/services/my_logger.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  late LanguagesAvailable selectedLanguage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.d("inittt");
    if (LanguageController.lastLanguage == "arabic") {
      selectedLanguage = LanguagesAvailable.arabic;
    } else {
      selectedLanguage = LanguagesAvailable.en_US;
    }
  }

  Map l = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change Language".tr),
      ),
      body: Column(
        children: <Widget>[
          myH(16),
          buildLanguageTile('English', LanguagesAvailable.en_US),
          buildLanguageTile('Arabic', LanguagesAvailable.arabic),
          myBtn(
              padding: EdgeInsets.all(16),
              onPressed: () async {
                //change current language
                // String lastSelectedLanguage =
                //     selectedLanguage.toString().split('.')[1];
                // Get.updateLocale(Locale(lastSelectedLanguage));

                //save in local storage
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('lastLanguage', lastSelectedLanguage);
                LanguageController.lastLanguage = lastSelectedLanguage;
                logger.d("lang saved");
                Get.back();
                myShowToast(msg: 'Language saved!');
              },
              btnText: 'Save'.tr,
              btnColor: Colors.blue)
        ],
      ),
    );
  }

  String lastSelectedLanguage = "en_US";
  Widget buildLanguageTile(String language, LanguagesAvailable value) {
    return ListTile(
      title: Text(language),
      leading: Radio(
        value: value,
        groupValue: selectedLanguage,
        onChanged: (LanguagesAvailable? value) {
          setState(() {
            selectedLanguage = value!;
            lastSelectedLanguage = selectedLanguage.toString().split('.')[1];
            Get.updateLocale(Locale(lastSelectedLanguage));
            // Get.updateLocale(Locale('arabic'));
          });
        },
      ),
    );
  }
}
