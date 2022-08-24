import 'dart:developer';

import 'package:confetti/confetti.dart';
import '../pages/all_todos_page/views/all_todos_list.dart';
import 'package:flutter/material.dart';
import '../central/widgets/my_show_toast.dart';
import '../central/services/my_logger.dart';
import '../models/todo_model.dart';
import 'all_todos_provider.dart';
import 'user_controller.dart';
import 'package:get/get.dart' hide Response;

class AddTodosController extends GetxController {
  TodoModel todoModel = TodoModel();
  TextEditingController tasktitleTeCtrl = TextEditingController();
  final confettiController = ConfettiController();
  DateTime? selectedDateTime;

  final allTodosController = Get.find<AllTodosController>();
  bool isUploading = false;

  Future createTodo(BuildContext context) async {
    logger.d("in createTodo");
    if (!validateData()) {
      return;
    }
    todoModel.createdOn = DateTime.now();

    feedTodoData(context);
    try {
      // await todosColRef.add(todoModel.toJson());

      allTodosController.addTodo(todoModel);

      myShowToast(
        msg: "Todo Created",
        bgColor: Colors.green,
      );
      resetData();
      showConfettiAnimation();
      // Get.back();
    } catch (e) {
      logger.e(e);
      setLoading(false);
      myShowToast(
        msg: "Something went wrong",
        bgColor: Colors.red,
      );
    }
  }

  feedTodoData(BuildContext context) {
    todoModel
      ..id = DateTime.now().toString()
      ..taskTitle = tasktitleTeCtrl.text;

    inspect(todoModel);
  }

  bool validateData() {
    if (tasktitleTeCtrl.text == "" || selectedDateTime == null) {
      logger.d("", "Task Title and DateTime both are required");
      myShowToast(
          msg: "Task Title and DateTime both are required",
          bgColor: Colors.red);
      return false;
    }

    return true;
  }

  feedInitialDataInUi(TodoModel todoModel) {
    logger.d("in feedInitialDataInUi()");
    this.todoModel = todoModel;
    tasktitleTeCtrl.text = todoModel.taskTitle;
    debugPrint("initialData: ${tasktitleTeCtrl.text}");
  }

  setLoading(bool status) {
    isUploading = status;
    update();
  }

  @override
  void dispose() {
    logger.d("in dispose: AddTodoProvider");
    tasktitleTeCtrl.dispose();
    super.dispose();
  }

  void showConfettiAnimation() async {
    confettiController.play();
    await Future.delayed(const Duration(seconds: 1));
    confettiController.stop();
  }

  void resetData() {
    todoModel = TodoModel();
    tasktitleTeCtrl.text = "";
    // selectedDateTime =
    update();
  }
}
