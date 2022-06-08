import 'dart:developer';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/authProvider.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        overlayOpacity: 0.9,
        child: Container(
          height: getHeight(context),
          width: getWidth(context),
          color: Colors.black,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Login to\nDigistore App",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  height: 1.6),
                            ),
                          ),
                          Expanded(
                              child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                    ),
                    Lottie.asset('assets/images/login.json'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hint: "Enter mobile number",
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          Provider.of<DigiStoreProvider>(context, listen: false)
                              .setValidUser(false);
                        },
                        formatters: [LengthLimitingTextInputFormatter(10)],
                        controller: controller,
                        isEnabled: true,
                        type: "login"),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<DigiStoreProvider>(
                      builder: (context, provider, child) {
                        return provider.validUser == true
                            ? CustomTextField(
                                hint: "Enter OTP",
                                inputType: TextInputType.number,
                                onChanged: (value) {},
                                formatters: [
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                controller: otpController,
                                isEnabled: true,
                                type: "login")
                            : Container();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        checkWithApi();
                      },
                      child: Container(
                        height: 40,
                        width: getWidth(context) / 2,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.black),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkWithApi() async {
    bool flag =
        Provider.of<DigiStoreProvider>(context, listen: false).validUser;
    if (flag == false) {
      if (controller.text.toString().trim().isNotEmpty &&
          controller.text.toString().trim().length == 10) {
        hideKeyBoard();
        context.loaderOverlay.show();
        await Provider.of<DigiStoreProvider>(context, listen: false)
            .checkDigiStoreStatus(controller.text.toString(), context);
        context.loaderOverlay.hide();
      } else {
        showToast("Mobile number must be of 10 digits", context);
      }
    } else {
      context.loaderOverlay.show();
      if (otpController.text.toString().trim().isNotEmpty &&
          otpController.text.toString().trim().length == 4) {
        await Provider.of<AuthProvider>(context, listen: false).verifyOTP(
            controller.text.toString(), otpController.text.toString(), context);
        context.loaderOverlay.hide();
      }
    }
  }
}
