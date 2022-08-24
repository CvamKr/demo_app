import 'package:demo_app/src/central/authentication/authentication_controller.dart';
import 'package:demo_app/src/controllers/user_controller.dart';
import 'package:demo_app/src/pages/my_base_page/my_base_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/all_todos_page/all_todos_page.dart';
import '../../pages/login_page/login_page.dart';
import '../services/my_logger.dart';
import 'my_loading_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthenticationController authenticationController =
      Get.find<AuthenticationController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("WidgetsBinding");
      // authentication.checkUser(context);
      authenticationController.checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
