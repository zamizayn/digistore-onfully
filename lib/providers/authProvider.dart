import 'package:digistoreapp/repo/authenticationRepo.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  AuthRepo repo = AuthRepo();

  Future<String> checkNumber(String number, BuildContext context) async {
    await repo.checkUser(number, context);
    return "";
  }

  Future<String> verifyOTP(
      String number, String otp, BuildContext context) async {
    await repo.verifyOTp(number, otp, context);
    return "";
  }
}
