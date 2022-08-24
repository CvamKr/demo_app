import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../central/services/my_logger.dart';

import '../models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserModel userModel = UserModel();
  feedDataToUserModel(User? user) {
    logger.d("in feedData");
    if (user == null) {
      userModel = UserModel();
    } else {
      userModel
        ..userId = user.uid
        ..displayName = user.displayName ?? ""
        ..displayPic = user.photoURL ?? "";
    }
    inspect(userModel);
  }

  List<double> listDummyMembers = [0, 18];
}
