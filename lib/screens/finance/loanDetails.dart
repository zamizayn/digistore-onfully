import 'dart:convert';
import 'dart:developer';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/modals/financeModel.dart';
import 'package:digistoreapp/modals/financePojo.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/repo/sheetsDataUpload.dart';
import 'package:digistoreapp/screens/finance/loanPdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  _LoanDetailsState createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController pancardController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController nomineeNameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController typeOfloanController = TextEditingController();
  TextEditingController nomineeNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Loan Details"),
      body: LoaderOverlay(
        overlayOpacity: 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SubmissionForm(
            nameController: nameController,
            aadharController: aadharController,
            addressController: addressController,
            pincodeController: pincodeController,
            pancardController: pancardController,
            dobController: dobController,
            contactController: contactController,
            nomineeNameController: nomineeNameController,
            relationController: relationController,
            loanAmountController: loanAmountController,
            typeOfloanController: typeOfloanController,
            nomineeNumberController: nomineeNumberController,
          ),
        ),
      ),
    );
  }
}

class SubmissionForm extends StatefulWidget {
  const SubmissionForm(
      {Key? key,
      required this.nameController,
      required this.aadharController,
      required this.addressController,
      required this.pincodeController,
      required this.pancardController,
      required this.dobController,
      required this.contactController,
      required this.nomineeNameController,
      required this.relationController,
      required this.loanAmountController,
      required this.typeOfloanController,
      required this.nomineeNumberController})
      : super(key: key);

  final TextEditingController nameController;
  final TextEditingController aadharController;
  final TextEditingController addressController;
  final TextEditingController pincodeController;
  final TextEditingController pancardController;
  final TextEditingController dobController;
  final TextEditingController contactController;
  final TextEditingController nomineeNameController;
  final TextEditingController relationController;
  final TextEditingController loanAmountController;
  final TextEditingController typeOfloanController;
  final TextEditingController nomineeNumberController;

  @override
  State<SubmissionForm> createState() => _SubmissionFormState();
}

class _SubmissionFormState extends State<SubmissionForm> {
  @override
  void initState() {
    super.initState();
    var data = Provider.of<DigiStoreProvider>(context, listen: false)
        .selectedLoanService;
    widget.typeOfloanController.text = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: getWidth(context),
            child: InkWell(
              onTap: () {
                navigate(context, LoanPdf());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: Text(
                          "View Required Documents for faster approvals",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
                "Before we disburse the amount , please fill down the following form with the details of customer."),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/loanimg.jpg",
            width: getWidth(context),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              hint: "Enter full name",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.nameController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter aadhar number",
              inputType: TextInputType.number,
              formatters: [
                LengthLimitingTextInputFormatter(12),
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: widget.aadharController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter full address",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.addressController,
              isEnabled: true,
              type: "address",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter pincode",
              inputType: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6)
              ],
              controller: widget.pincodeController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter pancard number",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.pancardController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950, 1, 1),
                      lastDate: DateTime.now())
                  .then((value) {
                if (value != null) {
                  var inputFormat = DateFormat('dd/MM/yyyy');
                  var inputDate = inputFormat.format(value);
                  widget.dobController.text = inputDate;
                  setState(() {});
                }
              });
            },
            child: CustomTextField(
                hint: "Enter date of birth",
                inputType: TextInputType.name,
                formatters: [],
                controller: widget.dobController,
                isEnabled: false,
                type: "",
                onChanged: (value) {}),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter contact number",
              inputType: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
              controller: widget.contactController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Enter nominee name",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.nomineeNameController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Relation with nominee",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.relationController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Nominee Contact Number",
              inputType: TextInputType.number,
              formatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: widget.nomineeNumberController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Loan amount",
              inputType: TextInputType.number,
              formatters: [FilteringTextInputFormatter.digitsOnly],
              controller: widget.loanAmountController,
              isEnabled: true,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: "Type of loan",
              inputType: TextInputType.name,
              formatters: [],
              controller: widget.typeOfloanController,
              isEnabled: false,
              type: "",
              onChanged: (value) {}),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              if (widget.nameController.text.trim().isEmpty) {
                showToast("Name cannot cannot be empty", context);
              } else if (widget.aadharController.text.trim().isEmpty) {
                showToast("Aadhar number cannot be empty", context);
              } else if (widget.addressController.text.trim().isEmpty) {
                showToast("Address cannot be empty", context);
              } else if (widget.pincodeController.text.trim().isEmpty) {
                showToast("Pincode cannot be empty", context);
              } else if (widget.pancardController.text.trim().isEmpty) {
                showToast("Pancard data cannot be empty", context);
              } else if (widget.dobController.text.trim().isEmpty) {
                showToast("Date of birth cannot be empty", context);
              } else if (widget.contactController.text.trim().isEmpty) {
                showToast("Contact number cannot be empty", context);
              } else if (widget.nomineeNameController.text.trim().isEmpty) {
                showToast("Nominee name cannot be empty", context);
              } else if (widget.relationController.text.trim().isEmpty) {
                showToast(
                    "Relation with nominee cannot be left empty", context);
              } else if (widget.loanAmountController.text.trim().isEmpty) {
                showToast("Loan Amount cannot be empty", context);
              } else if (widget.contactController.text.trim().length < 10) {
                showToast("Mobile number must be of 10 digits", context);
              } else if (widget.aadharController.text.trim().length < 12) {
                showToast("Aadhar number must be of 12 digits", context);
              } else if (widget.nomineeNumberController.text.trim().length <
                  10) {
                showToast(
                    "Nominee Mobile number must be of 10 digits", context);
              } else {
                String idVal =
                    await Provider.of<DigiStoreProvider>(context, listen: false)
                        .getNextId();
                UserData userData = await getPrefersnces();
                FinancePojo pojo = FinancePojo(
                    id: idVal,
                    name: widget.nameController.text.toString(),
                    typeOfObject: widget.typeOfloanController.text.toString(),
                    aadharNumber: widget.aadharController.text.toString(),
                    address: widget.addressController.text.toString(),
                    pincode: widget.pincodeController.text.toString(),
                    pancard: widget.pancardController.text.toString(),
                    dob: widget.dobController.text.toString(),
                    customerContactNumber:
                        widget.contactController.text.toString(),
                    nomineeNumber:
                        widget.nomineeNumberController.text.toString(),
                    nomineeName: widget.nomineeNameController.text.toString(),
                    nomineeRelation: widget.relationController.text.toString(),
                    loanAmount: widget.loanAmountController.text.toString(),
                    leadFrom: userData.mobileNumber.toString(),
                    type: "Loan Lead");
                log("DATAAAA" + financePojoToJson(pojo));
                final DateTime now = DateTime.now();
                final DateFormat formatter = DateFormat('dd-MM-yyyy');
                final String formatted = formatter.format(now);
                final data = {
                  FinanaceModel.nameOfCustomer:
                      widget.nameController.text.toString(),
                  FinanaceModel.aadharNo:
                      widget.aadharController.text.toString(),
                  FinanaceModel.fullAddress:
                      widget.addressController.text.toString(),
                  FinanaceModel.pincode:
                      widget.pincodeController.text.toString(),
                  FinanaceModel.pancard:
                      widget.pancardController.text.toString(),
                  FinanaceModel.DOB: widget.dobController.text.toString(),
                  FinanaceModel.contactNo:
                      widget.contactController.text.toString(),
                  FinanaceModel.loanAmount:
                      widget.loanAmountController.text.toString(),
                  FinanaceModel.nominee:
                      widget.nomineeNameController.text.toString() +
                          "\n" +
                          widget.nomineeNumberController.text.toString(),
                  FinanaceModel.date: formatted,
                  FinanaceModel.leadFrom: userData.mobileNumber.toString()
                };

                context.loaderOverlay.show();
                await SheetsFlutter.insert([data]);
                await Provider.of<DigiStoreProvider>(context, listen: false)
                    .submitLoanData(financePojoToJson(pojo));
                clearAllData();
                context.loaderOverlay.hide();
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                  "Register Now",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  clearAllData() {
    widget.nameController.clear();
    widget.aadharController.clear();
    widget.addressController.clear();
    widget.pincodeController.clear();
    widget.pancardController.clear();
    widget.dobController.clear();
    widget.contactController.clear();
    widget.nomineeNameController.clear();
    widget.nomineeNumberController.clear();
    widget.relationController.clear();
    widget.loanAmountController.clear();
  }
}
