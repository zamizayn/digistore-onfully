import 'dart:convert';
import 'dart:developer';

import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:digistoreapp/screens/edapt/edaptHome.dart';
import 'package:digistoreapp/screens/insurance.dart';
import 'package:digistoreapp/screens/onRealtor.dart';
import 'package:digistoreapp/screens/onfinance.dart';
import 'package:digistoreapp/screens/serviceDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

navigate(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void removeAndNavigate(Widget widget, BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
    (route) => false,
  );
}

showToast(String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      msg,
      style: TextStyle(fontFamily: "rale"),
      textAlign: TextAlign.center,
    ),
    duration: const Duration(seconds: 2),
  ));
}

hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class UserData {
  final int customerId;
  final String token;
  final String mobileNumber;

  UserData(
      {required this.customerId,
      required this.token,
      required this.mobileNumber});

  static UserData fromJson(Map<dynamic, dynamic> json) {
    return new UserData(
        customerId: json["customerId"],
        token: json["token"],
        mobileNumber: json["mobileNumber"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "customerId": this.customerId,
      "token": this.token,
      "mobileNumber": this.mobileNumber
    };
  }
}

Future<UserData> getPrefersnces() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? data = preferences.getString("userDataDigiStore");
  if (data != null) {
    Map userData = jsonDecode(data);
    log("get preferences" + userData.toString());
    return UserData.fromJson(userData);
  } else {
    return UserData(customerId: 0, token: "", mobileNumber: "");
  }
}

setPreferences(UserData data) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(
      "userDataDigiStore", jsonEncode(UserData.fromJson(data.toJson())));
}

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final List<TextInputFormatter> formatters;
  final TextEditingController controller;
  final bool isEnabled;
  final String type;
  final Function(String) onChanged;

  CustomTextField(
      {required this.hint,
      required this.inputType,
      required this.formatters,
      required this.controller,
      required this.isEnabled,
      required this.type,
      required this.onChanged});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      controller: widget.controller,
      inputFormatters: widget.formatters,
      onChanged: (data) {
        widget.onChanged(data);
      },
      enabled: widget.isEnabled,
      maxLines: widget.type == "address" ? 5 : 1,
      textInputAction: widget.type == "address"
          ? TextInputAction.newline
          : TextInputAction.done,
      style: widget.type == "login"
          ? TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
          : TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.green),
          ),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.green),
          ),
          hintText: widget.hint,
          hintStyle: widget.type == "login"
              ? TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)
              : TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.all(10)),
    );
  }
}

Widget onsoftwareWidgets(BuildContext context) {
  return Container(
    width: getWidth(context),
    height: getHeight(context),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "App Developement",
                'Mobile application development is the process of creating software applications that run on a mobile device, and a typical mobile application utilizes a network connection to work with remote computing resources. Hence, the mobile development process involves creating installable software bundles (code, binaries, assets, etc.) , implementing backend services such as data access with an API, and testing the application on target devices.There are two dominant platforms in the modern smartphone market. One is the iOS platform from Apple Inc. The iOS platform is the operating system that powers Apples popular line of iPhone smartphones. The second is Android from Google. The Android operating system is used not only by Google devices but also by many other OEMs to built their own smartphones and other smart devices.Although there are some similarities between these two platforms when building applications, developing for iOS vs. developing for Android involves using different software development kits (SDKs) and different development toolchain. While Apple uses iOS exclusively for its own devices, Google makes Android available to other companies provided they meet specific requirements such as including certain Google applications on the devices they ship. Developers can build apps for hundreds of millions of devices by targeting both of these platforms.',
                "assets/images/app.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice16",
                          videoId: "Ibx2Ri5Blh0",
                        )));
          },
          child: listing(context, "App Developement".toUpperCase(),
              "assets/images/app.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Website Developement",
                'Web development refers in general to the tasks associated with developing websites for hosting via intranet or internet. The web development process includes web design, web content development, client-side/server-side scripting and network security configuration, among other tasks.In a broader sense, web development encompasses all the actions, updates, and operations required to build, maintain and manage a website to ensure its performance, user experience, and speed are optimal.It might also, but not necessarily, include all those strategic actions needed to ensure its proper ranking on search engine results. Usually, those tasks pertain to a different specialization, namely search engine optimization (SEO)',
                "assets/images/web.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice17",
                          videoId: "YWA-xbsJrVg",
                        )));
          },
          child: listing(context, "Website Developement".toUpperCase(),
              "assets/images/web.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Developement Training",
                'Training and development is one of the lowest things on the priority list of most companies. When it is organized, it is often at the persistence of the human resources department. There is, however, enormous value in organizing proper training and development sessions for employees. Training allows employees to acquire new skills, sharpen existing ones, perform better, increase productivity and be better leaders. Since a company is the sum total of what employees achieve individually, organizati ..',
                "assets/images/train.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice18",
                          videoId: "CLr-xaQEnkE",
                        )));
          },
          child: listing(context, "Developement Training".toUpperCase(),
              "assets/images/train.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "School Management ERP",
                'School Management solution helps in organizing various aspects of school system including student, staff, admission, time table, examination, fees, reporting and so on. The system helps administrators to access, manage, and analyze data and processes for quick and well-informed decision-making.',
                "assets/images/erp.png");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice18",
                          videoId: "G3ClutFkpeA",
                        )));
          },
          child: listing(
              context, "School ERP".toUpperCase(), "assets/images/erp.png"),
        )
      ],
    ),
  );
}

Widget onmarketingWidgets(BuildContext context) {
  return Container(
    width: getWidth(context),
    height: getHeight(context),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "CCTV Security System",
                'A CCTV (closed-circuit television) system allows the use of videos cameras to monitor the interior and exterior of a property, transmitting the signal to a monitor or set of monitors.More and more of us are switching on the benefits of CCTV security systems. In the UK it is now estimated that there are more cameras per person than any other country in the world.Metropolitan Police Commissioner Bernard Hogan Howe promoted the use of CCTV, saying that cameras should be installed by homeowners and businesses to help detectives solve crimes',
                "assets/images/cctv.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice16",
                          videoId: "eGj9C4sD1hA",
                        )));
          },
          child: listing(
              context, "CCTV System".toUpperCase(), "assets/images/cctv.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Home & Office Automation",
                'A home automation system combines hardware and software via a wireless network to control your home electronics and appliances through one device which could be a smartphone, tablet, or a specific central automation control hub system. These devices can be controlled remotely even when you are not at home.',
                "assets/images/automate.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice17",
                          videoId: "jDaRPsvvcz4",
                        )));
          },
          child: listing(context, "Automation".toUpperCase(),
              "assets/images/automate.jpg"),
        ),
      ],
    ),
  );
}

AppBar appBarWidget(String title) {
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(title),
  );
}

Widget oneduWidgets(BuildContext context) {
  return Container(
    width: getWidth(context),
    height: getHeight(context),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Edapt",
                '💡നിങ്ങളുടെ കുട്ടികള്‍ക്കും ആര്‍ട്ടിഫിഷ്യല്‍ ഇന്‍റലിജെന്‍സ്  പഠിക്കാന്‍ താല്‍പര്യമുണ്ടോ ⚙️സിനിമകളിലും, പുസ്തകങ്ങളിലും മാത്രം കണ്ടു പരിചയമുള്ള ടെക്നോളജികള്‍ നിങ്ങളുടെ കുട്ടികളും നിര്‍മ്മിച്ചാലോ.\n\n🌎ലോകത്ത് എല്ലാ മേഖലകളിലും വലിയ മാറ്റങ്ങള്‍ ഇന്ന് AI വരുത്തുന്നുണ്ട്, പക്ഷെ സാങ്കേതിക വിദ്യ വളരുന്ന വേഗത്തില്‍ അത് നമ്മളിലേക്ക് എത്തുന്നില്ല എന്നതാണ് ഇത്തരം കാര്യങ്ങളില്‍ നിന്നും നമ്മെ പിറകോട്ട് വലിക്കുന്നത്. ഭാവിയിലേക്കുള്ള അവസരങ്ങള്‍ മനസ്സിലാക്കി അവ ഉപയോഗപ്പെടുത്താനും ഈ അറിവ് ഇന്ന് നമുക്ക് അത്യാവശ്യമാണ്. ഈ പ്രശ്നത്തിന് ഒരു പരിഹാരിമായിട്ടാണ് ഇഡാപ്റ്റ് Jr. AI Coder Program അവതരിപ്പിക്കുന്നത്.\n\n📌 5-12 ക്ലാസുകളില്‍ പഠിക്കുന്ന വിദ്യാര്‍ഥികള്‍ക്ക് കോഡിങ്ങിനെ കുറിച്ചോ മറ്റോ ഒരു മുന്‍വിവരവുമില്ലാതെ എളുപ്പത്തില്‍ പഠിക്കാന്‍ കഴിയുന്ന രീതിയില്‍ നിര്‍മ്മിച്ചിട്ടുള്ള ഒരു പ്രോഗ്രാമാണ് ഇത്. ആര്‍ട്ടിഫിഷ്യല്‍ ഇന്‍റലിജെന്‍സ് പ്രോജക്റ്റുകള്‍ കോഡിങ്ങിലൂടെ നിര്‍മ്മിക്കുന്നതിലൂടെ വലിയ കാര്യങ്ങള്‍ വളരെ ഈസിയായി ഈ ചെറിയ പ്രായത്തില്‍ തന്നെ പഠിക്കാന്‍ സാധിക്കുന്നു. 🔗 ഞങ്ങളുടെ പ്രേത്യേകതകൾ 👉 കോഡിങ്ങില്‍ മുന്‍പരിചയമില്ലാതെ തന്നെ ഈ കോഴ്സ് പഠിക്കാവുന്നതാണ്. വ്യക്തിഗത ക്ലാസുകളിലൂടെയും പഠിക്കാം.\n\n👉 13ൽ  പരം റിയൽ വേൾഡ് AI പ്രൊജെക്ടുകൾ ക്വിസ്കൾ ഉൾപ്പെടുത്തിയുള്ള പഠനരീതി ഒരു സർട്ടിഫൈഡ് ജൂനിയർ കോഡർ ആകാൻ സാധിക്കുന്നു നല്ലൊരു മാറ്റത്തിനായി ഇന്ന് തുടങ്ങാം:\n\n📱+91 79076 78946',
                "assets/images/edaptimage.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EdaptHome(
                        // serviceId: "onfullyservice10",
                        // videoId: "Qf5qSGHC7hg",
                        )));
          },
          child: listing(
              context, "Edapt".toUpperCase(), "assets/images/edaptimage.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Psychometry",
                'Psychometric testing is a type of test used in recruitment to measure a candidate mental capabilities and aptitude. An employer can use different tests to determine a candidates job suitability including verbal reasoning, logical reasoning, situational judgement and numerical reasoning. Each test gives a unique perspective of how a person demonstrates a specific skill or ability.Psychometric tests differ from traditional testing that measures education, knowledge or skill. Employers can see a persons educational background, achievements, and work experience during the application process and use them all to help identify suitable candidates for a job role.',
                "assets/images/psy.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice10",
                          videoId: "hDd5ahvDbx4",
                        )));
          },
          child: listing(
              context, "Psychometry".toUpperCase(), "assets/images/psy.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Mentoring",
                'Mentoring is a professional activity, a trusted relationship, a meaningful commitment. The origins of mentoring can be traced back to ancient Greece as a technique to impart to young men important social, spiritual, and personal values. Mentoring as we know it today is loosely modeled on the historical craftsman/apprentice relationship, where young people learned a trade by shadowing the master artisan. In the mid-70s, corporate America redefined mentoring as a career development strategy. The concept of mentoring faculty and administrators is relatively new to higher education and rare in information technology circles, where staff professional development often takes the form of technical manuals and certifications. It is precisely this type of support organization, however, that needs a strong foundation of mentoring to build and retain a healthy workforce that can react quickly to change and can develop, adapt, and regenerate itself over time.',
                "assets/images/mentor.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice11",
                          videoId: "qoy5MifHuLs",
                        )));
          },
          child: listing(
              context, "Mentoring".toUpperCase(), "assets/images/mentor.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Counselling",
                'World’s highest suicide rates among children are reported in India, specially among children in the age group of 15-28 years. The reasons for these suicides include fear of failing, family pressure, competitive pressure, depression, fear of unemployment and financial issues. Children are under extreme pressure that needs to be heard. Counselling can save children from these pressure but parent’s need to understand the importance and need of counselling and guidance.',
                "assets/images/counsel.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          videoId: "t6_5yc33wiI",
                          serviceId: "onfullyservice12",
                        )));
          },
          child: listing(context, "Career Counselling".toUpperCase(),
              "assets/images/counsel.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Enhance Memory",
                'The memory demands for school-age children are much greater than they are for adults. As adults, we have already acquired much of the knowledge and skills we need to function day to day. Although the knowledge base for some fields such as technology changes rapidly, the new information is generally highly specific and builds on existing knowledge. On the other hand, school children are constantly bombarded with new knowledge in multiple topic areas in which they may or may not be interested. Additionally, they are expected to both learn and demonstrate the mastery of this knowledge on a weekly basis. Thus, an effective and efficient memory is critical for school success.',
                "assets/images/memory.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice13",
                          videoId: "_9D2yG7PNuk",
                        )));
          },
          child: listing(context, "Enhance Memory".toUpperCase(),
              "assets/images/memory.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "College Admission",
                'We are in the midst of exam season and soon many students will start thinking of going to college. It is a period of stress and excitement for parents and students alike as they chalk out their plans for the future. It is no secret that lakhs of students are going to go abroad for their studies. This article highlights some of the more frequently asked questions about studies abroad and what does it entail.',
                "assets/images/ad.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice14",
                          videoId: "paz37C_cH58",
                        )));
          },
          child: listing(
              context, "Admission".toUpperCase(), "assets/images/ad.jpg"),
        ),
        // InkWell(
        //   onTap: () {
        //     Provider.of<ServiceProvider>(context, listen: false).setData(
        //         "Study Materials",
        //         'Learning materials in teaching are crucial to the success of student achievement. That is, the instructional components of lesson planning in teaching depend on the selection of teaching materials. "Teaching materials" is a generic term used to describe the resources teachers use to deliver instruction. Teaching materials can support student learning and increase student success. Ideally, the teaching materials will be tailored to the content in which they are being used, to the students in whose class they are being used, and the teacher. Teaching materials come in many shapes and sizes, but they all have in common the ability to support student learning.',
        //         "assets/images/study.jpg");
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => ServiceDetail(
        //                   serviceId: "onfullyservice15",
        //                   videoId: "z7YdX7-46zI",
        //                 )));
        //   },
        //   child: listing(context, "Study Materials", "assets/images/study.jpg"),
        // )
      ],
    ),
  );
}

Column onfinanceWidgets(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Provider.of<ServiceProvider>(context, listen: false).setData(
              "OnFinance",
              'We provide financial assistance to our valuable customers who are in need . We collect the information only what we need and provide you the support whatever your needs.\nThe types of loans we provide are Gold Loans, Vehicle Loans, Home Loans, Business Loans, Finance, Investments and Funding.',
              "assets/images/fin.jpg");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OnFinance(
                        serviceId: "onfullyservice23",
                        videoId: "AI_h5HECOnQ",
                      )));
        },
        child: premiumWidgetFullWidth(
            context, "OnFinance", "assets/images/fin.jpg"),
      )
    ],
  );
}

Widget realtorWidget(BuildContext context) {
  return Container(
    width: getWidth(context),
    height: getHeight(context),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "OnRealtor",
                'A Realtor is an independent contractor who helps people buy and sell real estate. Much of what they do happens behind the scenes. They are continually working all hours of the day.A good Realtor will make a real estate transaction flow smoothly, leaving the impression that their job is relatively simple. The fact is - that couldnt be further from the truth. We will assist you in Property developement, all types of interior work , all types of construction works and more.',
                "assets/images/real.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OnRealtors(
                          serviceId: "onfullyservice22",
                          videoId: "l9HJuAx-EoQ",
                        )));
          },
          child: listing(context, "OnRealtor", "assets/images/real.jpg"),
        )
      ],
    ),
  );
}

Widget onHealthWidgets(BuildContext context) {
  return Container(
    width: getWidth(context),
    height: getHeight(context),
    child: GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Doctor@Home",
                'One of the worst parts about going to the doctor’s office is sitting in the waiting room. If you have children, you have to decide whether your may-be-sick kid should risk sitting in a room with patients who have coughs, fevers and runny noses.When you schedule an appointment with doctors who make house calls, you eliminate the need to sit in a room with a group of sick, contagious patients. This is great if you simply need a checkup or you are worried about a little one.\nDuring sick seasons, waiting rooms back up. Even if you show up on time for your appointment, you may not get to see the doctor until well after your scheduled appointment. A doctor house call brings the doctor to you, so you can wait in the comfort of your own home without waiting on a line of patients in front of you.',
                "assets/images/doc.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice19",
                          videoId: "UYjlbTnF-YE",
                        )));
          },
          child: listing(context, "Doctor@Home", "assets/images/doc.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Lab@Home",
                'Medical lab testing, also known as diagnostic testing is very essential in the delivery of good quality healthcare. A physician or other medical practitioner can prescribe a test to diagnose and/or monitor a patient’s health condition. With the advent of medical technology, a wide range of medical tests are available to humankind. Taking regular tests has become very important in the modern day. However, going to a diagnostic centre takes a lot of precious time and effort from our schedule. Availing lab tests at home though can make it easier and convenient for the patient.',
                "assets/images/lab.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice20",
                          videoId: "hT6Th_QfQKE",
                        )));
          },
          child: listing(context, "Lab@Home", "assets/images/lab.jpg"),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Medicine@Home",
                'For centuries, cultures around the world have relied on traditional herbal medicine to meet their healthcare needs.Despite medical and technological advancements of the modern era, the global demand for herbal remedies is on the rise. In fact, it’s estimated that this industry grosses about 60 billion annually.Some natural remedies may be more affordable and accessible than conventional medicines, and many people prefer using them because they align with their personal health ideologies ',
                "assets/images/med.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice21",
                          videoId: "hT6Th_QfQKE",
                        )));
          },
          child: listing(context, "Medicine@Home", "assets/images/med.jpg"),
        )
      ],
    ),
  );
}

Widget onMarketingWidgetsNoStartUP(BuildContext context) {
  return Container(
    height: 200,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
            onTap: () {
              Provider.of<ServiceProvider>(context, listen: false).setData(
                  "Solar Kit",
                  'Solar panels generate their own power and can therefore greatly offset your monthly electricity bill, if not eliminate it. The higher your bill, the more likely you will benefit from switching. But you should note that electricity rates and usage — the main charges on your statement — are volatile."If a utility’s electricity prices fluctuate, so could the amount of savings," says Garrett Nilsen, deputy director for the U.S. Department of Energys solar energy technologies office. "Similarly, if energy consumption changes, the amount of savings can also vary."',
                  "assets/images/solar.jpg");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceDetail(
                            serviceId: "onfullyservice4",
                            videoId: "EWV4e453y8Y",
                          )));
            },
            child: listing(context, "SOLAR", "assets/images/solar.jpg")),
        // InkWell(
        //   onTap: () {
        //     Provider.of<ServiceProvider>(context, listen: false).setData(
        //         "Inverter",
        //         'Electricity has been a major invention playing a leading role in making the life easy and comfortable. People in most parts of the globe can’t imagine life without the lights flickering up after its dark, the fan making the days in summer comfortable and even the morning bread coming out warm from the toaster. Electricity defines the modern life, be it at the home or at the workplace, it is an irreplaceable element. However, with increased power consumption and newer gadgets being introduced into our lives, the same power inputs acts as a spoilsport. Well, technology has yet again played its part in making our life smoother as we have the inverter technology that makes the lights glow, the fans work and the toasters cook even regardless of the availability of the electricity!',
        //         "assets/images/inverter.jpg");
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => ServiceDetail(
        //               serviceId: "onfullyservice5",
        //                   videoId: "_lsrYCBPReE",
        //                 )));
        //   },
        //   child: listing(
        //     context,
        //     "INVERTER",
        //     "assets/images/inverter.jpg",
        //   ),
        // ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Water Purifier",
                'Whether your water comes from city water or well-based water systems, you want to ensure that it’s safe for your family. There are many opportunities for contaminants to enter your water, and even if your water is free of contaminants, high levels of minerals can affect the taste of your tap water or make the operation of your dishwasher or clothes washer less efficient.\nThe consequences of having unsafe drinking water can be dire. Pollutants like heavy metals can have profound health consequences at worst, or at best make your water unpalatable. While the vast majority of municipal water systems in the United States do an excellent job of treating our water and ensuring water quality, there is always the danger of system failures, so it’s best to be safe. If you filter your water with an effective home water filtration system you’re making a smart investment in the health of your family.',
                "assets/images/water.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice6",
                          videoId: "GjBKeS4xq1M",
                        )));
          },
          child: listing(
            context,
            "WATER PURIFIER",
            "assets/images/water.jpg",
          ),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Vertical Farming",
                'Vertical farming is one such solution that has been implemented around the world. By Vertical Farming, food crops can be cultivated easily in urban areas by planting in vertically stacked layers in order to save space and use minimal energy and water for irrigation.',
                "assets/images/farming.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice7",
                          videoId: "3Ww2TP_tU7o",
                        )));
          },
          child: listing(
            context,
            "VERTICAL FARMING",
            "assets/images/farming.jpg",
          ),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Aquaponics",
                'Aquaponics is a cooperation between plants and fish and the term originates from the two words aquaculture (the growing of fish in a closed environment) and hydroponics (the growing of plants usually in a soil-less environment).Aquaponic systems come in various sizes from small indoor units to large commercial units. and they can be either freshwater systems or contain salt or brackish water.\nIn other words, according to the Aquaponics Gardening Community, cited by Thorarinsdottir, aquaponics is the cultivation of fish and plants together in a constructed, recirculating ecosystem utilizing natural bacterial cycles to convert fish waste to plant nutrition. This is an environmentally friendly, natural food-growing method that harnesses the best attributes of aquaculture and hydroponics without the need to discard any water or filtrate or add chemical fertilizers.',
                "assets/images/aqua.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice8",
                          videoId: "yhcAOE2JOVs",
                        )));
          },
          child: listing(
            context,
            "AQUAPONICS",
            "assets/images/aqua.jpg",
          ),
        ),
        InkWell(
          onTap: () {
            Provider.of<ServiceProvider>(context, listen: false).setData(
                "Hydroponics",
                'Hydroponics is the cultivation of plants without using soil. Hydroponic flowers, herbs, and vegetables are planted in inert growing media and supplied with nutrient-rich solutions, oxygen, and water. This system fosters rapid growth, stronger yields, and superior quality. When a plant is grown in soil, its roots are perpetually searching for the necessary nutrition to support the plant. If a plant’s root system is exposed directly to water and nutrition, the plant does not have to exert any energy in sustaining itself. The energy the roots would have expended acquiring food and water can be redirected into the plant’s maturation. As a result, leaf growth flourishes as does the blooming of fruits and flowers.   Plants sustain themselves by a process called photosynthesis. Plants capture sunlight with chlorophyll (a green pigment present in their leaves). They use the light’s energy to split water molecules they’ve absorbed via their root system. The hydrogen molecules combine with carbon dioxide to produce carbohydrates, which plants use to nourish themselves. Oxygen is then released into the atmosphere, a crucial factor in preserving our planets habitability. Plants do not need soil to photosynthesize. They need the soil to supply them with water and nutrients. When nutrients are dissolved in water they can be applied directly to the plants root system by flooding, misting, or immersion. Hydroponic innovations have proven direct exposure to nutrient-filled water can be a more effective and versatile method of growth than traditional irrigation. \nHydroponic systems work by allowing minute control over environmental conditions like temperature and pH balance and maximized exposure to nutrients and water. Hydroponics operates under a very simple principle: provide plants exactly what they need when they need it. Hydroponics administer nutrient solutions tailored to the needs of the particular plant being grown. They allow you to control exactly how much light the plants receive and for how long. pH levels can be monitored and adjusted. In a highly customized and controlled environment, plant growth accelerates.   By controlling the environment of the plant, many risk factors are reduced. Plants grown in gardens and fields are introduced to a host of variables that negatively impact their health and growth. Fungus in the soil can spread diseases to plants. Wildlife like rabbits can plunder ripening vegetables from your garden. Pests like locusts can descend on crops and obliterate them in an afternoon. Hydroponic systems end the unpredictability of growing plants outdoors and in the earth. Without the mechanical resistance of the soil, seedlings can mature much faster. By eliminating pesticides, hydroponics produce much healthier and high-quality fruits and vegetables. Without obstacles, plants are free to grow vigorously and rapidly. ',
                "assets/images/hydro.jpg");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetail(
                          serviceId: "onfullyservice9",
                          videoId: "wBcnUUkdavE",
                        )));
          },
          child: listing(
            context,
            "HYDROPONICS",
            "assets/images/hydro.jpg",
          ),
        ),
      ],
    ),
  );
}

Padding listing(BuildContext context, String title, String path) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: premiumWidget(context, title, path),
  );
}

Column insuranceWidget(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Provider.of<ServiceProvider>(context, listen: false).setData(
              "OnInsurance",
              'The premium of an insurance policy is the amount that you need to pay to purchase a specific amount of insurance cover. It is typically expressed as a regular cost, be it monthly, quarterly, half-yearly, or annually, that you incur during the premium payment term.There are various factors based on which an insurance company calculates the premium of an insurance policy. The idea behind is to check the eligibility of an insured individual for the specific type of insurance policy that he/she wants to buy.\nOnInsurance offers you Life Insurance, Health Insurance and vehicle insurance.',
              "assets/images/insu.jpg");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OnInSurance(
                        serviceId: "onfullyservice24",
                        videoId: "uPqNNshSA9I",
                      )));
        },
        child: premiumWidgetFullWidth(
            context, "OnInsurance", "assets/images/insu.jpg"),
      )
    ],
  );
}

Container premiumWidget(BuildContext context, String title, String path) {
  return Container(
    child: Stack(
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Explore More".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.assistant_direction_sharp, color: Colors.white)
              ],
            ),
          ),
        )
      ],
    ),
    width: getWidth(context),
    decoration: BoxDecoration(
        color: const Color(0xff000000),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: new AssetImage(path),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        )),
  );
}

Container premiumWidgetFullWidth(
    BuildContext context, String title, String path) {
  return Container(
    child: Stack(
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Explore More".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.assistant_direction_sharp, color: Colors.white)
              ],
            ),
          ),
        )
      ],
    ),
    height: 190.0,
    width: getWidth(context),
    decoration: BoxDecoration(
        color: const Color(0xff000000),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: new AssetImage(path),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        )),
  );
}
