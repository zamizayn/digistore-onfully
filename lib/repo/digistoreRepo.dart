import 'dart:convert';
import 'dart:developer';
import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/modals/leadPojo.dart';
import 'package:digistoreapp/providers/authProvider.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/services/webService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DigiStoreRepo {
  WebService service = WebService();

  Future<String> checkUser(BuildContext context, String phoneNumber) async {
    Map<String, String> body = {"phone_number": phoneNumber};
    Map<String, String> headers = {};
    final response =
        await service.postResponse("customer/check-customer/", body, headers);
    if (response.statusCode == 200) {
      Map responseData = json.decode(response.body);
      if (responseData["message"] == "not registered") {
        showToast("You are not a registered Digistore user", context);
      } else {
        showToast("Please enter the OTP to proceed further", context);
        Provider.of<DigiStoreProvider>(context, listen: false)
            .setValidUser(true);
        Provider.of<AuthProvider>(context, listen: false)
            .checkNumber(phoneNumber, context);
      }
    } else {
      showToast("You are not a registered user", context);
    }

    return "";
  }

  Future<String> loanSubmit(String loanData) async {
    UserData data = await getPrefersnces();
    Map<String, String> body = {
      "customer_id": data.customerId.toString(),
      "data": loanData
    };
    Map<String, String> headers = {};
    final response = await service.postResponse(
        "credit_details/add-onfinance/", body, headers);
    if (response.statusCode == 200) {
      Map responseData = json.decode(response.body);
      log("RESPONSEEE" + responseData.toString());
    }
    return "";
  }

  Future<String> getMyLeads(BuildContext context) async {
    UserData data = await getPrefersnces();
    Map<String, String> body = {
      "phone_number": data.mobileNumber.toString(),
    };
    Map<String, String> headers = {};
    final response = await service.postResponse(
        "credit_details/get-loans-under-me/", body, headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      LeadPojo pojo = LeadPojo.fromJson(responseData);
      Provider.of<DigiStoreProvider>(context, listen: false).setLeads(pojo);
      log("RESPONSEEE" + responseData.toString());
    }
    return "";
  }

   Future<String> gteLoanStatus(BuildContext context, String id) async {
    Map<String, String> body = {"customer_id": id};
    Map<String, String> headers = {};
    final response = await service.postResponse("credit_details/get-loan-status/", body, headers);
    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody["loanstatus"] == null) {
      Provider.of<DigiStoreProvider>(context, listen: false)
          .setFlag(responseBody["loanstatus"]);
    } else if (responseBody["loanstatus"] == true) {
      Provider.of<DigiStoreProvider>(context, listen: false).setFlag("Approved");
    } else {
      Provider.of<DigiStoreProvider>(context, listen: false).setFlag("Rejected");
    }

   

    return "";
  }

  Future<String> getLoanId() async {
    UserData data = await getPrefersnces();
    Map<String, String> body = {};
    Map<String, String> headers = {};
    final response = await service.postResponse(
        "credit_details/get-next-id/", body, headers);
    if (response.statusCode == 200) {
      Map responseData = json.decode(response.body);
      log("RESPONSEEE" + responseData.toString());
      return responseData["nextid"].toString();
    }
    return "";
  }
}
