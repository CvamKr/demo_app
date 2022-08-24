import '../../central/language_controller.dart';
import '../../central/widgets/my_drawer.dart';
import '../../controllers/user_controller.dart';
import '../add_todo_page/add_todo_page.dart';
import '../all_todos_page/all_todos_page.dart';
import '../encryption_page.dart';
import '../stop_watch_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBasePage extends StatefulWidget {
  const MyBasePage({Key? key}) : super(key: key);
  @override
  State<MyBasePage> createState() => _MyBasePageState();
}

class _MyBasePageState extends State<MyBasePage> {
  String displayName = Get.find<UserController>().userModel.displayName;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    LanguageController.setLanguage();
  }

  final List<Widget> pages = [
    const EncryptionPage(),
    const AllTodosPage(),
    const StopWatchPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: FittedBox(child: Text("${"Welcome".tr} $displayName")),
          // leading: MyCampusDrawer(),
        ),
        body: Center(
          child: pages.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.enhanced_encryption,
                // color: Colors.blue,
              ),
              label: "Encryption".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.task,
                // color: Colors.blue,
              ),
              label: "To-Do".tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.watch,
                // color: Colors.blue,
              ),
              label: "Stopwatch".tr,
            ),
          ],
          currentIndex: selectedIndex,
          // fixedColor: Colors.blue,
          onTap: onItemTapped,
          // selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 16),
          // unselectedFontSize: 14,
          // selectedIconTheme:
          //     const IconThemeData(color: Colors.blue, opacity: 1.0, size: 30.0),
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.blue,
          elevation: 8,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,

          // unselectedLabelStyle:
          //     const TextStyle(fontSize: 18, color: Colors.pink),
        ),
      ),
    );
  }
}
