import 'package:flutter/material.dart';

import '../../../central/widgets/my_text.dart';
import '../../../controllers/add_todo_controller.dart';
import 'package:get/get.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({Key? key}) : super(key: key);

  @override
  State<MyDateTimePicker> createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  final addTodoController = Get.find<AddTodosController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: GetBuilder<AddTodosController>(builder: (addTodoController) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
          child: myText(
              txt: addTodoController.todoModel.deadline != null
                  ? addTodoController.todoModel.deadline.toString()
                  : "Date and time".tr,
              color: addTodoController.todoModel.deadline == null
                  ? Colors.grey.withOpacity(.7)
                  : Colors.white),
        );
      }),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: addTodoController.todoModel.deadline ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        addTodoController.selectedDateTime = picked;
        _selectTime(context);
      });
    } else {
      addTodoController.selectedDateTime = null;
    }
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedS != null) {
      setState(() {
        selectedTime = pickedS;
        DateTime? dateTime = addTodoController.selectedDateTime;

        dateTime = DateTime(dateTime!.year, dateTime.month, dateTime.day,
            selectedTime.hour, selectedTime.minute);
        addTodoController.todoModel.deadline = dateTime;
      });
    } else {
      addTodoController.selectedDateTime = null;
    }
  }
}
