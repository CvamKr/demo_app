import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/src/pages/all_todos_page/views/show_delete_dialog.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/all_todos_provider.dart';
import 'todo_template.dart';
import '../../../central/services/my_logger.dart';
import '../../../models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllTodosList extends StatefulWidget {
  const AllTodosList({Key? key}) : super(key: key);

  @override
  State<AllTodosList> createState() => _AllTodosListState();
}

class _AllTodosListState extends State<AllTodosList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllTodosController>(
        builder: (allTodosController) => allTodosController.todosList.isEmpty
            ? Center(
                child: Lottie.network(
                    "https://assets4.lottiefiles.com/private_files/lf30_e3pteeho.json",
                    height: 250))
            : buildTodoList(allTodosController));
  }

  Widget buildTodoList(AllTodosController allTodosController) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
      itemCount: allTodosController.todosList.length,
      // itemCount: 10,

      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        TodoModel todoModel = allTodosController.todosList[index];
        return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (d) => showDeleteDialog(context, todoModel),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete'.tr,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24),
              child: TodoTemplate(todoModel),
            ));
      },
    );
  }
}
