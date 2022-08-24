import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import '../../../central/widgets/my_btn.dart';
import '../../../controllers/all_todos_provider.dart';
import '../../../models/todo_model.dart';

import '../../../central/widgets/my_text.dart';
import 'package:get/get.dart';

showDeleteDialog(BuildContext context, TodoModel todoModel) {
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
      Get.find<AllTodosController>().deleteTodo(todoModel);
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: myText(
        txt: "Delete".tr,
        textAlign: TextAlign.center,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    content: myText(
        txt: "Are you sure you want to delete this task?".tr,
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
