import 'dart:convert';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/modals/leadPojo.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeadDetails extends StatefulWidget {
  const LeadDetails({Key? key}) : super(key: key);

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  String id = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      var data =
          Provider.of<DigiStoreProvider>(context, listen: false).selectedLead;
      Datum? detail = data;
      id = detail!.id.toString();
      Provider.of<DigiStoreProvider>(context, listen: false)
          .getLoanStatus(context, id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Lead Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<DigiStoreProvider>(builder: (context, provider, child) {
              Datum data = provider.selectedLead!;
              String json = datumToJson(data);
              //  log("providerrr" + json.encode(data));
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  provider.flag != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Loan Status : " + provider.flag.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.purple),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Loan Status : No response yet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.red),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  LeadFromMap(data: jsonDecode(datumToJson(data))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class LeadFromMap extends StatefulWidget {
  final Map data;
  LeadFromMap({required this.data});

  @override
  State<LeadFromMap> createState() => _LeadFromMapState();
}

class _LeadFromMapState extends State<LeadFromMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: makeWidgetChildren(widget.data)),
      ),
    );
  }

  List<Widget> makeWidgetChildren(jsonObject) {
    List<Widget> children = [];
    jsonObject = jsonObject.toString().replaceAll("{", "").toString();
    jsonObject = jsonObject.toString().replaceAll("}", "").toString();

    var dataSp = jsonObject.split(',');

    Map<String, String> mapData = Map();
    dataSp.forEach((element) {
      if (element.split(':').length > 1) {
        if (element.split(":")[1].length > 1) {
          mapData[element.split(':')[0]] = element.split(':')[1];
        }
      }
    });

    mapData.forEach(
      (key, value) {
        children.add(
          Padding(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: getWidth(context) / 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${key.toString().replaceAll("\"", "").toString().trim()}',
                          style: TextStyle(fontFamily: "montbold"),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  Text(
                    ":",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        '${value.toString().replaceAll("\"", "").toString().replaceAll("'\n'", "").trim()}',
                        style: TextStyle(fontFamily: "montbold"),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8.0)),
        );
      },
    );
    return children;
  }
}
