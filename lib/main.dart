import 'dart:io';
import 'dart:ui';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/authProvider.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:digistoreapp/repo/sheetsDataUpload.dart';
import 'package:digistoreapp/screens/homeScreen.dart';
import 'package:digistoreapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClientt(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ServiceProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => DigiStoreProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "lato",
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      UserData data = await getPrefersnces();
      if (data.customerId != 0) {
        removeAndNavigate(HomeScreen(), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            )),
        height: getHeight(context),
        width: getWidth(context),
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Text(""),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome to\nDigiStore",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                        height: 1.4),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      navigate(context, Login());
                    },
                    child: Container(
                      height: 40,
                      width: getWidth(context) / 2,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
