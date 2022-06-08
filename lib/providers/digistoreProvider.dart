import 'dart:developer';
import 'package:digistoreapp/modals/leadPojo.dart';
import 'package:digistoreapp/repo/authenticationRepo.dart';
import 'package:digistoreapp/repo/digistoreRepo.dart';
import 'package:flutter/cupertino.dart';

class DigiStoreProvider with ChangeNotifier {
  DigiStoreRepo repo = DigiStoreRepo();
  AuthRepo authRepo = AuthRepo();
  bool validUser = false;
  String selectedLoanService = "";
  LeadPojo? leads;
  Datum? selectedLead;
  dynamic flag;

  setFlag(dynamic flagVal) {
    this.flag = flagVal;
    notifyListeners();
  }

  setSelectedLead(Datum pojo) {
    this.selectedLead = pojo;
  }

  getLoanStatus(BuildContext context, String id) {
   // showLoading(context);
    repo.gteLoanStatus(context, id);
  }

  setLeads(LeadPojo pojo) {
    this.leads = pojo;
    notifyListeners();
  }

  Future<String> submitLoanData(String data) async {
    await repo.loanSubmit(data);
    return "";
  }

  Future<String> fetchLeads(BuildContext context) async {
    await repo.getMyLeads(context);
    return "";
  }

  Future<String> getNextId() async {
    return await repo.getLoanId();
  }

  setSelectedloanService(String selectedLoan) {
    switch (selectedLoan) {
      case "0":
        this.selectedLoanService = "Personal Loan";
        break;
      case "1":
        this.selectedLoanService = "Business Loan";
        break;
      case "2":
        this.selectedLoanService = "Education Loan";
        break;
      case "3":
        this.selectedLoanService = "Vehicle Loan";
        break;
      case "4":
        this.selectedLoanService = "Home Loan";
        break;
      case "5":
        this.selectedLoanService = "Property Loan";
        break;
    }
    notifyListeners();
  }

  Future<String> checkDigiStoreStatus(
      String number, BuildContext context) async {
    validUser = false;
    await repo.checkUser(context, number);
    return "";
  }

  setValidUser(bool flag) {
    this.validUser = flag;
    notifyListeners();
  }
}
