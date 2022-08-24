import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';
import '../../pages/login_page/login_page.dart';
import '../../pages/my_base_page/my_base_page.dart';
import '../widgets/my_snackbar.dart';

import '../services/my_logger.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  late final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<User?> signInWithGoogle(BuildContext context) async {
    logger.d("in signInWithGoogle");
    setLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
   
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        return user = userCredential.user;

      } catch (e) {
        debugPrint(e.toString());
      }
    } else {

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          return user = userCredential.user;
      
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                content:
                    'The account already exists with a different credential.',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              mySnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnackBar(
              content: 'Error occurred using Google Sign-In. Try again.',
            ),
          );
        } finally {
          setLoading(false);
        }
      }
      setLoading(false);
      return user;
    }
    return null;
  }

  setLoading(bool status) {
    isLoading = status;
    update();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        mySnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  signOut(BuildContext context) async {
    await _signOut(context);

    // context.read<UserProvider>().userModel = UserModel();
  }

  checkUser() {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {

      if (firebaseUser == null) {
        Get.find<UserController>().feedDataToUserModel(null);
        Get.offAll(() => const LoginPage());
      } else {
        Get.find<UserController>().feedDataToUserModel(firebaseUser);
        Get.offAll(() => const MyBasePage());
      }
    });
  }
}
