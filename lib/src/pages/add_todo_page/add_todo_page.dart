import 'package:demo_app/src/central/widgets/my_sized_box.dart';

import '../../central/widgets/my_btn.dart';
import '../../central/widgets/my_confetti_widget.dart';
import '../../central/widgets/my_text.dart';
import '../../central/widgets/my_textfield.dart';

import '../../central/widgets/my_loading_widget.dart';

import 'package:flutter/material.dart';
import '../../controllers/add_todo_controller.dart';
import 'views/my_date_time_picker.dart';
import 'package:get/get.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);
  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTodosController>(builder: (addTodoController) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            backgroundColor: const Color(0xff46539E),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: myText(
                  txt: "Add Task".tr,
                  color: const Color(0xffB9BFDB),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff5899DA),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  // NameTf(),
                  myTextField(
                      addTodoController.tasktitleTeCtrl, "Task Name".tr),

                  const SizedBox(height: 24),
                  const MyDateTimePicker(),
                  Row(
                    children: <Widget>[
                      addTodoController.isUploading == true
                          ? const MyLoadingWidget()
                          : Expanded(
                              child: myBtn(
                                  onPressed: () {
                                    addTodoController.createTodo(context);
                                  },
                                  txtSize: 16,
                                  btnColor: const Color(0XFF2EB9EF),
                                  btnText: "Save".tr),
                            ),
                      myW(16),
                      Expanded(
                        child: myBtn(
                            onPressed: () {
                              addTodoController.resetData();
                            },
                            txtSize: 16,
                            btnColor: const Color(0XFF2EB9EF),
                            btnText: "Clear".tr),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          MyConfettiWidget()
        ],
      );
    });
  }
}
