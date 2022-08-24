import '../central/widgets/my_btn.dart';
import '../central/widgets/my_icon_btn.dart';
import '../central/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:get/get.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  final _stopWatchTimer = StopWatchTimer(
    onChange: (value) {
      final displayTime = StopWatchTimer.getDisplayTime(value);
    },
  );

  final Stopwatch stopwatch = Stopwatch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildStopWatch(), myH(32), buildButton()],
      )),
    );
  }

  Widget buildStopWatch() {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(value!);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32),
              height: Get.width / 1.5,
              width: Get.width / 1.5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.circular(200)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    displayTime.substring(0, 8),
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            myH(16)
          ],
        );
      },
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            onPressed: () {
              _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
            },
            child: Icon(Icons.stop, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: Colors.red, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            onPressed: () {
              _stopWatchTimer.onExecute.add(StopWatchExecute.start);
            },
            child: Icon(Icons.play_arrow, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: Colors.green, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            onPressed: () {
              _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
            },
            child: Icon(Icons.pause, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: Colors.blue, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }
}
