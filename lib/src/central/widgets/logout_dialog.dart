import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:demo_app/src/central/authentication/authentication_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'my_btn.dart';
import 'my_text.dart';

showLogoutDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = myBtn(
    btnText: "Cancel".tr,
    btnColor: Colors.white,
    btnBorderColor: Colors.blue,
    btnTextColor: Colors.blue,
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget deleteButton = myBtn(
    btnText: "OK".tr,
    padding: EdgeInsets.only(bottom: 8),
    btnColor: Colors.blue,
    // btnWidth: 200,
    onPressed: () {
      Get.find<AuthenticationController>().signOut(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: myText(
        txt: "Logout".tr,
        textAlign: TextAlign.center,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    content: myText(
        txt: "Are you sure you want to logout?".tr,
        textAlign: TextAlign.center),
    actions: [
      deleteButton,
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
