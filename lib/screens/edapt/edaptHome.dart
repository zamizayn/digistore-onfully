import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/screens/edapt/viewPdf.dart';
import 'package:flutter/material.dart';

class EdaptHome extends StatefulWidget {
  const EdaptHome({Key? key}) : super(key: key);

  @override
  _EdaptHomeState createState() => _EdaptHomeState();
}

class _EdaptHomeState extends State<EdaptHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Edapt"),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/edapt.jpeg",
                width: getWidth(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "💡നിങ്ങളുടെ കുട്ടികള്‍ക്കും ആര്‍ട്ടിഫിഷ്യല്‍ ഇന്‍റലിജെന്‍സ്  പഠിക്കാന്‍ താല്‍പര്യമുണ്ടോ ⚙️സിനിമകളിലും, പുസ്തകങ്ങളിലും മാത്രം കണ്ടു പരിചയമുള്ള ടെക്നോളജികള്‍ നിങ്ങളുടെ കുട്ടികളും നിര്‍മ്മിച്ചാലോ.\n\n🌎ലോകത്ത് എല്ലാ മേഖലകളിലും വലിയ മാറ്റങ്ങള്‍ ഇന്ന് AI വരുത്തുന്നുണ്ട്, പക്ഷെ സാങ്കേതിക വിദ്യ വളരുന്ന വേഗത്തില്‍ അത് നമ്മളിലേക്ക് എത്തുന്നില്ല എന്നതാണ് ഇത്തരം കാര്യങ്ങളില്‍ നിന്നും നമ്മെ പിറകോട്ട് വലിക്കുന്നത്. ഭാവിയിലേക്കുള്ള അവസരങ്ങള്‍ മനസ്സിലാക്കി അവ ഉപയോഗപ്പെടുത്താനും ഈ അറിവ് ഇന്ന് നമുക്ക് അത്യാവശ്യമാണ്. ഈ പ്രശ്നത്തിന് ഒരു പരിഹാരിമായിട്ടാണ് ഇഡാപ്റ്റ് Jr. AI Coder Program അവതരിപ്പിക്കുന്നത്.\n\n📌 5-12 ക്ലാസുകളില്‍ പഠിക്കുന്ന വിദ്യാര്‍ഥികള്‍ക്ക് കോഡിങ്ങിനെ കുറിച്ചോ മറ്റോ ഒരു മുന്‍വിവരവുമില്ലാതെ എളുപ്പത്തില്‍ പഠിക്കാന്‍ കഴിയുന്ന രീതിയില്‍ നിര്‍മ്മിച്ചിട്ടുള്ള ഒരു പ്രോഗ്രാമാണ് ഇത്. ആര്‍ട്ടിഫിഷ്യല്‍ ഇന്‍റലിജെന്‍സ് പ്രോജക്റ്റുകള്‍ കോഡിങ്ങിലൂടെ നിര്‍മ്മിക്കുന്നതിലൂടെ വലിയ കാര്യങ്ങള്‍ വളരെ ഈസിയായി ഈ ചെറിയ പ്രായത്തില്‍ തന്നെ പഠിക്കാന്‍ സാധിക്കുന്നു. 🔗 ഞങ്ങളുടെ പ്രേത്യേകതകൾ 👉 കോഡിങ്ങില്‍ മുന്‍പരിചയമില്ലാതെ തന്നെ ഈ കോഴ്സ് പഠിക്കാവുന്നതാണ്. വ്യക്തിഗത ക്ലാസുകളിലൂടെയും പഠിക്കാം.\n\n👉 13ൽ  പരം റിയൽ വേൾഡ് AI പ്രൊജെക്ടുകൾ ക്വിസ്കൾ ഉൾപ്പെടുത്തിയുള്ള പഠനരീതി ഒരു സർട്ടിഫൈഡ് ജൂനിയർ കോഡർ ആകാൻ സാധിക്കുന്നു നല്ലൊരു മാറ്റത്തിനായി ഇന്ന് തുടങ്ങാം:\n\n📱+91 79076 78946",
                  style: TextStyle(color: Colors.white, height: 2),
                ),
              ),
              Image.asset(
                "assets/images/edapt2.jpeg",
                width: getWidth(context),
              ),
              SizedBox(
                width: getWidth(context) / 2,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      navigate(context, ViewPdf());
                    },
                    child: Text(
                      "Show More Details",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                width: getWidth(context) / 2,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      //   navigate(context, ViewPdf());
                    },
                    child: Text(
                      "Enroll Now",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
