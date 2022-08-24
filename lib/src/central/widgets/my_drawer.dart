import 'package:demo_app/src/central/authentication/authentication_controller.dart';
import 'package:demo_app/src/central/widgets/logout_dialog.dart';

import '../../controllers/all_todos_provider.dart';
import 'my_sized_box.dart';
import 'my_text.dart';
import '../../pages/change_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  final displayEventsCtrl = Get.find<AllTodosController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: ListTile(
            title: myText(
                txt: "Demo App", fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Get.back();
            Get.to(() => ChangeLanguage());
          },
          title: Text("Change Language".tr),
        ),
        Divider(),
        ListTile(
          onTap: () {
            showLogoutDialog(context);
          },
          title: Text("Logout".tr),
        ),
        Divider(),
        Spacer(),
        myText(txt: 'App version: 1.0.0'),
        myH(16)
      ],
    ));
  }
}
