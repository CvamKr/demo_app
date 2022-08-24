import 'package:demo_app/src/central/authentication/authentication_controller.dart';
import 'package:demo_app/src/controllers/encryption_controller.dart';
import 'package:demo_app/src/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/add_todo_controller.dart';
import '../controllers/all_todos_provider.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTodosController(), fenix: true);
    Get.lazyPut(() => AddTodosController(), fenix: true);
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => EncryptionController(), fenix: true);
  }
}
