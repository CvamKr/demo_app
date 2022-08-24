import 'package:demo_app/src/central/widgets/my_show_toast.dart';
import 'package:flutter/material.dart' hide Key;

import 'package:encrypt/encrypt.dart';

import '../central/services/my_logger.dart';
import 'package:get/get.dart';

class EncryptionController extends GetxController {
//for AES Algorithms

  static Encrypted? encrypted;
  static var decrypted;
  static String? secretKey;

  static TextEditingController messageController = TextEditingController();
  static TextEditingController secretKeyController = TextEditingController();

  static Map encryptedMap = {};

  static encryptMessage(plainText) {
    if (messageController.text.isEmpty || secretKeyController.text.isEmpty) {
      myShowToast(msg: "All fields are required");
      return;
    }

    encryptAES(plainText);
    encryptedMap = {
      "secretKey": secretKeyController.text,
      "message": encrypted!.base64
    };
    showTextInUi(showEncypted: true);
  }

  static encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    // final key = Key.fromUtf8('abcd');

    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted!.base64);
  }

  static decryptMessage(plainText) {
    if (encryptedMap["secretKey"] != secretKeyController.text ||
        messageController.text != encrypted!.base64) {
      logger.d("Wrong secret key or Message");
      myShowToast(msg: "Wrong secret key or Message");
      return;
    }
    decryptAES(plainText);
    showTextInUi(showEncypted: false);
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    print(decrypted);
  }

  static String showTextt = "";
  static String? showTextInUi({required bool showEncypted}) {
    if (showEncypted) {
      return showTextt = encrypted != null ? encrypted!.base64 : "";
    }

    return showTextt = decrypted ?? "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    messageController.text = "";
    secretKeyController.text = "";
    showTextt = "";
  }
}
