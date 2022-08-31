import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:sai/src/utils/api_status.dart';

import '../models/request_login.dart';
import '../services/user_services.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  String emailLogin = "";
  String passwordLogin = "";
  bool isAlreadyCheck = false;

  bool isValidForm() {
    isAlreadyCheck = true;
    notifyListeners();
    return formKeyLogin.currentState?.validate() ?? false;
  }

  Future<void> login(BuildContext context) async {
    if (!isValidForm()) return;

    final requesLogin = RequesLogin(user: emailLogin, pass: passwordLogin);
    final result = await showDialog(
      context: context,
      builder: (context) => FutureProgressDialog(
        UserServices.loguinUsers(requesLogin),
        message: const Text('Cargando...'),
      ),
    );

    if (result is Failure) {
      print(result.errorResponse);
    }
    if (result is Success) {
      print(result.response);
    }
  }
}