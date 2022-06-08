import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/digistoreProvider.dart';
import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:digistoreapp/screens/finance/loanDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class OnFinance extends StatefulWidget {
  final String videoId;
  final String serviceId;
  OnFinance({required this.videoId, required this.serviceId});

  @override
  _OnFinanceState createState() => _OnFinanceState();
}

class _OnFinanceState extends State<OnFinance> {
  YoutubePlayerController? _controller;
  int index = 0;

  @override
  void dispose() {
    super.dispose();
    _controller!.close();
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: YoutubePlayerParams(
        autoPlay: true,
        showVideoAnnotations: false,
        // startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ServiceProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.green,
        title: Text("OnFinance"),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    data.getImagePath,
                    width: getWidth(context),
                    height: getHeight(context) / 2,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: getWidth(context),
                        child: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                data.getHeader,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        height: 60,
                        color: Colors.black.withOpacity(0.5),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.getContent,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      height: 2,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              index = 0;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == 0 ? Colors.green : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 100,
                                  width: getWidth(context) / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNzCPJtKYxYr0ehL3U27U3c_Pl0MHjDDMdRA&usqp=CAU"),
                                          fit: BoxFit.cover)),
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Personal\nLoan",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                index = 1;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == 1 ? Colors.green : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 100,
                                    width: getWidth(context) / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnzB_40Ual4Pn0Ozt5tbKh1D70N1M-HfM4eQ&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Business\nLoan",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                index = 2;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == 2 ? Colors.green : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 100,
                                    width: getWidth(context) / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSamdQoyTRKDfqeM9UawgzzmpzgLH-L8n498Q&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Education\nLoan",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                index = 3;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == 3 ? Colors.green : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 100,
                                    width: getWidth(context) / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL65o4l0SPacQSsLMGPwfTV0YbMotLguBB4g&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Vehicle\nLoan",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                index = 4;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == 4 ? Colors.green : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 100,
                                    width: getWidth(context) / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoApXa0W-X804QNcO1GnrXm2R7MgsfCd2qYQ&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Home\nLoan",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                index = 5;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      index == 5 ? Colors.green : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height: 100,
                                    width: getWidth(context) / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7q9O76MEsrERWV_TpoWHhkFTOVroSV91lA&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Property\nLoan",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context) / 2,
                child: InkWell(
                  onTap: () {
                    Provider.of<DigiStoreProvider>(context, listen: false)
                        .setSelectedloanService(index.toString());
                    navigate(context, LoanDetails());
                    // getLoading(context);
                    // LoginVm loginVm = LoginVm();
                    // loginVm.enquiry(context, widget.serviceId);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
