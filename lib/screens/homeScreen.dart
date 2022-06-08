import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/repo/sheetsDataUpload.dart';
import 'package:digistoreapp/screens/login.dart';
import 'package:digistoreapp/screens/myLeads/myLeads.dart';
import 'package:digistoreapp/screens/productsDetail.dart';
import 'package:digistoreapp/screens/wallet/wallethome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await SheetsFlutter.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          // InkWell(
          //   onTap: () {
          //     navigate(context, WalletHome());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.money,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              navigate(context, MyLeads());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.people,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              removeAndNavigate(Login(), context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/bgnew.jpg"),
                          fit: BoxFit.cover)),
                  // color: Colors.greenAccent,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/onfully.png",
                        height: 200,
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "Wallet",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnMarketing",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnEducation",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnSoftware",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnHealth",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnRealtors",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnFinance",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          "OnInsurance",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getWidth(context) / 2,
                        child: InkWell(
                          onTap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            await preferences.clear();
                            removeAndNavigate(Login(), context);
                          },
                          child: Card(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(Icons.logout),
                                  Text(
                                    "Logout",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        height: getHeight(context),
        width: getWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // YoutubeVideoWidget(),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Newly added\nproducts on DigiStore",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.green,
                      size: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Explore all the products inside DigiStore platform",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                onMarketingWidgetsNoStartUP(context),
                SizedBox(height: 20),
                Text(
                  "All Products",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnMarketing"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnMarketing", "assets/images/marketing.jpg"),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnEducation"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnEducation", "assets/images/education.jpg"),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnSoftware"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnSoftware", "assets/images/software.jpg"),
                ),

                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnHealth"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnHealth", "assets/images/health.jpg"),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnRealtor"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnRealtors", "assets/images/realtor.jpg"),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnFinance"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnFinance", "assets/images/finance.jpeg"),
                ),

                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    navigate(context, ProductDetail(type: "OnInsurance"));
                  },
                  child: premiumWidgetFullWidth(
                      context, "OnInsurance", "assets/images/insurance.jpg"),
                ),

                // Text(
                //   "OnEducation",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // oneduWidgets(context),
                // SizedBox(height: 20),
                // Text(
                //   "OnSoftware",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // onsoftwareWidgets(context),
                // SizedBox(height: 20),
                // Text(
                //   "OnHealth",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // onHealthWidgets(context),
                // SizedBox(height: 20),
                // Text(
                //   "OnRealtor",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // realtorWidget(context),
                // SizedBox(height: 20),
                // Text(
                //   "OnFinance",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // onfinanceWidgets(context),
                // SizedBox(height: 20),
                // Text(
                //   "OnInsurance",
                //   style: TextStyle(color: Colors.white, fontSize: 17),
                // ),
                // SizedBox(height: 10),
                // insuranceWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
