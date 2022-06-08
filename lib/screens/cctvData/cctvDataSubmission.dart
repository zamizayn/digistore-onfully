import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/modals/cctvPojo.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class CCTVSubmission extends StatefulWidget {
  const CCTVSubmission({Key? key}) : super(key: key);

  @override
  State<CCTVSubmission> createState() => _CCTVSubmissionState();
}

class _CCTVSubmissionState extends State<CCTVSubmission> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String typeOfRoof = "";
  int val = -1;
  String status = "";
  int con_val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("CCTV Data Submission"),
      body: LoaderOverlay(
        overlayOpacity: 0.9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/cctv.jpg",
                  width: getWidth(context),
                  height: getHeight(context) / 3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Datas required for the installation of CCTV in your area",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: "Enter customer name",
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
                    hint: "Enter customer address",
                    inputType: TextInputType.streetAddress,
                    formatters: [],
                    controller: addressController,
                    isEnabled: true,
                    type: "address",
                    onChanged: (value) {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Enter customer mobile number",
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
                    hint: "Enter customer email address",
                    inputType: TextInputType.emailAddress,
                    formatters: [],
                    controller: emailController,
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
                        "Project Category",
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
                        typeOfRoof = "Residential";
                        setState(() {});
                      },
                      child: Text(
                        "Residential",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: val,
                    onChanged: (value) {
                      val = 1;
                      typeOfRoof = "Residential";
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
                        typeOfRoof = "Commerical";
                        setState(() {});
                      },
                      child: Text(
                        "Commercial",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 2,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: val,
                    onChanged: (value) {
                      val = 2;
                      typeOfRoof = "Commercial";
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
                        typeOfRoof = "Industrial";
                        setState(() {});
                      },
                      child: Text(
                        "Industrial",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      val = 3;
                      typeOfRoof = "Industrial";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Construction Stage Completion Status",
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
                        con_val = 1;
                        status = "Planning";
                        setState(() {});
                      },
                      child: Text(
                        "Planning",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 1,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: con_val,
                    onChanged: (value) {
                      con_val = 1;
                      status = "Planning";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: InkWell(
                      onTap: () {
                        con_val = 2;
                        status = "Electrical Starting";
                        setState(() {});
                      },
                      child: Text(
                        "Electrical Starting",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    value: 2,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: con_val,
                    onChanged: (value) {
                      con_val = 2;
                      status = "Electrical Starting";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: InkWell(
                      onTap: () {
                        con_val = 3;
                        status = "Near to finish";
                        setState(() {});
                      },
                      child: Text(
                        "Near to finish",
                        style: TextStyle(fontSize: 14),
                      )),
                  leading: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 3,
                    groupValue: con_val,
                    onChanged: (value) {
                      con_val = 3;
                      status = "Near to finish";
                      setState(() {});
                    },
                    activeColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    if (nameController.text.isEmpty) {
                      showToast("Name cannot be empty", context);
                    } else if (addressController.text.isEmpty) {
                      showToast("Address cannot be empty", context);
                    } else if (numberController.text.toString().length < 10) {
                      showToast("Mobile number cannot empty", context);
                    } else if (typeOfRoof == "") {
                      showToast("Please choose Project Category", context);
                    } else if (status == "") {
                      showToast("Please choose completion status", context);
                    } else {
                      CCTVPojo pojo = CCTVPojo(
                          name: nameController.text.toString(),
                          address: addressController.text.toString(),
                          mobileNumber: numberController.text.toString(),
                          email: emailController.text.toString(),
                          residential_category: typeOfRoof,
                          completion_status: status,
                          type: "CCTV System");
                      context.loaderOverlay.show();
                      await Provider.of<DigiStoreProvider>(context,
                              listen: false)
                          .submitLoanData(cctvPojoToJson(pojo));
                      context.loaderOverlay.hide();
                      nameController.clear();
                      addressController.clear();
                      numberController.clear();
                      emailController.clear();
                      typeOfRoof = "";
                      status = "";
                      val = -1;
                      con_val = -1;
                      setState(() {});
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
          ),
        ),
      ),
    );
  }
}
