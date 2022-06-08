import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/screens/myLeads/leadDetails.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class MyLeads extends StatefulWidget {
  const MyLeads({Key? key}) : super(key: key);

  @override
  State<MyLeads> createState() => _MyLeadsState();
}

class _MyLeadsState extends State<MyLeads> {
  bool show = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await Provider.of<DigiStoreProvider>(context, listen: false)
          .fetchLeads(context);
      show = false;
      setState(() {});
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Leads So Far"),
      ),
      body: show == false
          ? Container(
              height: getHeight(context),
              width: getWidth(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Consumer<DigiStoreProvider>(
                        builder: (context, provider, child) {
                      return provider.leads != null
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {
                                      Provider.of<DigiStoreProvider>(context,
                                              listen: false)
                                          .setSelectedLead(
                                              provider.leads!.data[index]);
                                      navigate(context, LeadDetails());
                                    },
                                    leading: Icon(Icons.person_outline),
                                    title: Text(provider
                                        .leads!.data[index].customerName));
                              },
                              separatorBuilder: (context, ind) {
                                return Divider();
                              },
                              itemCount: provider.leads!.data.length)
                          : Container(
                              child: Text("No Leads yet"),
                            );
                    })
                  ],
                ),
              ),
            )
          : Container(
              height: getHeight(context),
              width: getWidth(context),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
