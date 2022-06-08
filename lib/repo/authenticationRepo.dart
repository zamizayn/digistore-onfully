import 'dart:convert';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/screens/homeScreen.dart';
import 'package:digistoreapp/services/webService.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  WebService service = WebService();

  Future<String?> checkUser(String mobileNumber, BuildContext context) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    Map<String, String> body = {"phone_number": mobileNumber};
    final response = await service.postResponse(
        "customer/customer-number-verification/", body, headers);
    Map<String, dynamic> map = json.decode(response.body);
    return "";
  }

  Future<String?> verifyOTp(
      String mobileNumber, String otp, BuildContext context) async {
    hideKeyBoard();
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    Map<String, String> body = {"phone_number": mobileNumber, "otp": otp};
    final response = await service.postResponse(
        "customer/customer-otp-verification/", body, headers);
    Map<String, dynamic> map = json.decode(response.body);
    if (map["message"] == "Success") {
      showToast("OTP Verified successfully", context);
      UserData userData = UserData(
          customerId: map["customer_id"],
          token: map["token"],
          mobileNumber: mobileNumber);
      await setPreferences(userData);
      await getPrefersnces();
      navigate(context, HomeScreen());
    } else {
      showToast("Invalid OTP", context);
    }

    return "checkUser";
  }
}
