import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import 'user_controller.dart';
import 'package:get/get.dart' hide Response;

class AllTodosController extends GetxController {
  List<TodoModel> todosList = [];

  // Stream<QuerySnapshot> getTodos(BuildContext context) {
  //   String userId = context.read<UserProvider>().userModel.userId;
  //   return todosColRef
  //       .where("postedBy", isEqualTo: userId)
  //       .orderBy("createdOn", descending: true)
  //       .snapshots();
  // }
  getTodos(BuildContext context) {
    return todosList;
  }

  void addTodo(TodoModel todoModel) {
    todosList.add(todoModel);
    
    update();
  }

   deleteTodo(todoModel) {
    todosList.removeWhere((element) => element.id == todoModel.id);
    update();
  }
}
