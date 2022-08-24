
import '../../central/services/my_logger.dart';
import '../../central/widgets/my_text.dart';
import '../add_todo_page/add_todo_page.dart';
import 'views/task_info.dart';
import '../../models/todo_model.dart';
import 'views/all_todos_list.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllTodosPage extends StatefulWidget {
  const AllTodosPage({Key? key}) : super(key: key);

  @override
  State<AllTodosPage> createState() => _AllTodosPageState();
}

class _AllTodosPageState extends State<AllTodosPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TaskInfo(),
          const Expanded(child: AllTodosList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddTodoPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
