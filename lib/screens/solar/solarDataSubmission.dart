import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/modals/solarPojo.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class SolarDataSubmission extends StatefulWidget {
  const SolarDataSubmission({Key? key}) : super(key: key);

  @override
  State<SolarDataSubmission> createState() => _SolarDataSubmissionState();
}

class _SolarDataSubmissionState extends State<SolarDataSubmission> {
  TextEditingController nameController = TextEditingController();
  TextEditingController consumerNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController shopCountController = TextEditingController();
  String typeOfRoof = "";
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Solar Details"),
      body: LoaderOverlay(
        overlayOpacity: 0.9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                      "Before we contact , please fill down the following form with the details of customer."),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/solar.jpg",
                  width: getWidth(context),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: "Enter full name",
                    inputType: TextInputType.name,
                    formatters: [],
                    controller: nameController,
                    isEnabled: true,
                    type: "",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Enter consumer number",
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: consumerNumberController,
                    isEnabled: true,
                    type: "",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Enter address",
                    inputType: TextInputType.name,
                    formatters: [],
                    controller: addressController,
                    isEnabled: true,
                    type: "address",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Enter mobile number",
                    inputType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    controller: numberController,
                    isEnabled: true,
                    type: "",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Enter email address",
                    inputType: TextInputType.emailAddress,
                    formatters: [],
                    controller: mailController,
                    isEnabled: true,
                    type: "",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Type of Roof Top",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: InkWell(
                      onTap: () {
                        val = 1;
                        typeOfRoof = "Open Terrace";
                        setState(() {});
                      },
                      child: Text(
                        "Open Terrace",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: val,
                    onChanged: (value) {
                      val = 1;
                      typeOfRoof = "Open Terrace";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: InkWell(
                      onTap: () {
                        val = 2;
                        typeOfRoof = "Sheeted";
                        setState(() {});
                      },
                      child: Text(
                        "Sheeted",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 2,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: val,
                    onChanged: (value) {
                      val = 2;
                      typeOfRoof = "Sheeted";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: InkWell(
                      onTap: () {
                        val = 3;
                        typeOfRoof = "Any Other Form";
                        setState(() {});
                      },
                      child: Text(
                        "Any Other Form",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      val = 3;
                      typeOfRoof = "Any Other Form";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "No of houses or Shops in Kerala in your Name?",
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: shopCountController,
                    isEnabled: true,
                    type: "",
                    onChanged: (value) {}),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: getWidth(context) / 2,
                  child: InkWell(
                    onTap: () async {
                      if (nameController.text.trim().isEmpty) {
                        showToast("Name cannot be empty", context);
                      } else if (consumerNumberController.text.trim().isEmpty) {
                        showToast("Consumer Number cannot be empty", context);
                      } else if (addressController.text.trim().isEmpty) {
                        showToast("Address cannot be empty", context);
                      } else if (numberController.text.trim().isEmpty ||
                          numberController.text.trim().toString().length < 10) {
                        showToast(
                            "Mobile number must be of 10 digits", context);
                      } else if (mailController.text.trim().isEmpty) {
                        showToast("Email address cannot be empty", context);
                      } else if (typeOfRoof == "") {
                        showToast("Select Type Of Roof", context);
                      } else {
                        SolarPojo pojo = SolarPojo(
                            type: "Solar Lead",
                            name: nameController.text.toString(),
                            consumerNumber:
                                consumerNumberController.text.toString(),
                            address: addressController.text.toString(),
                            mobileNumber: numberController.text.toString(),
                            emailAddress: mailController.text.toString(),
                            typeOfRoof: typeOfRoof,
                            shopsCount: shopCountController.text.toString());
                        context.loaderOverlay.show();
                        await Provider.of<DigiStoreProvider>(context,
                                listen: false)
                            .submitLoanData(solarPojoToJson(pojo));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clearAllData() {
    nameController.clear();
    consumerNumberController.clear();
    addressController.clear();
    numberController.clear();
    mailController.clear();
    val = -1;
    typeOfRoof = "";
    shopCountController.clear();
    setState(() {});
  }
}
