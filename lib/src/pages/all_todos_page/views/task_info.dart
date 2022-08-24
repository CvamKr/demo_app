import '../../../central/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import '../../../central/authentication/authentication_controller.dart';
import '../../../central/widgets/my_icon_btn.dart';
import '../../../central/widgets/my_sized_box.dart';
import '../../../central/widgets/my_text.dart';

import '../../../central/widgets/my_cached_network_image.dart';
import 'package:intl/intl.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.1,
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          MyCachedNetworkImage(
            padding: EdgeInsets.zero,
            imageUrl: "https://wallpapercave.com/wp/wp4286413.jpg",
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.1,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 17, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText(
                        txt: "Your\nTodos",
                        color: Colors.white.withOpacity(.8),
                        fontSize: 32),
                    myH(16),
                    myText(
                        txt: DateFormat.MMMd().format(DateTime.now()),
                        color: Colors.white.withOpacity(.5))
                  ],
                ),
              ),
              const Spacer(),
              // buildInfo(context)
            ],
          ),
        ],
      ),
    );
  }
}
