import 'dart:math';

import 'package:flutter/material.dart';
import '../../../central/widgets/my_cached_network_image.dart';
import '../../../central/widgets/my_sized_box.dart';
import '../../../central/widgets/my_text.dart';
import '../../../models/todo_model.dart';
import 'show_delete_dialog.dart';
import 'package:intl/intl.dart';

class TodoTemplate extends StatelessWidget {
  final TodoModel todoModel;
  const TodoTemplate(this.todoModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          // myText(txt: todoModel.id),
          myH(16),
          Row(
            children: <Widget>[
              MyCachedNetworkImage(
                imageUrl:
                    "https://i.pravatar.cc/150?img=${Random().nextInt(20)}",
                circleRadius: 26,
              ),
              myW(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: myText(
                              txt: todoModel.taskTitle,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.65)),
                        ),
                        if (todoModel.deadline != null)
                          myText(
                              txt: todoModel.deadline!.toString(),
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                      ],
                    ),
                    myH(3),
                    Row(
                      children: [
                        Expanded(
                          child: myText(
                              txt: todoModel.description,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(.9)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          myH(16),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey.withOpacity(.2),
          ),
        ],
      ),
    );
  }

  Widget userAvatar(double? padding) {
    return Positioned(
      right: padding,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: MyCachedNetworkImage(
            circleRadius: 9,
            imageUrl: "https://i.pravatar.cc/150?img=${Random().nextInt(20)}",
          ),
        ),
      ),
    );
  }
}
