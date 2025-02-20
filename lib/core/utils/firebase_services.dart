import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_app/core/services/snack_bar_services.dart';

class FirebaseServices {
  static Future<bool> createAccount(
      {required String emailAddress, required String password}) async {
    EasyLoading.show();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account Created Successfully");

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The password provided is too weak.');

        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The account already exists for that email.');

        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage(
          "An unexpected error occurred. Please try again.");
      return Future.value(false);
    }
  }

  static Future<bool> login(
      {required String emailAddress, required String password}) async {
    EasyLoading.show();

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      SnackBarService.showSuccessMessage("Login Successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? 'No user found for that email.');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'Wrong password provided for that user.');
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage(
          "An unexpected error occurred. Please try again.");
      return Future.value(false);
    }
  }
}
