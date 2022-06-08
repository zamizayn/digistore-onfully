import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class OnRealtors extends StatefulWidget {
  final String videoId;
  final String serviceId;

  @override
  _OnRealtorsState createState() => _OnRealtorsState();

  OnRealtors({required this.videoId, required this.serviceId});
}

class _OnRealtorsState extends State<OnRealtors> {
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
        title: Text(data.getHeader),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        color: Colors.black,
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
                      color: Colors.white,
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
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7tZNXSGrKF4tBffnKOeLYLKdpaUlNGVxmKA&usqp=CAU"),
                                          fit: BoxFit.cover)),
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Property\nDevelopement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
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
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsfw_LWcGWvHv8Ikbl7yOHwrpMflXA3V9HBA&usqp=CAU"),
                                            fit: BoxFit.cover)),
                                    child: Text(""),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Interior\nWork",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              index = 2;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == 2 ? Colors.green : Colors.white,
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
                                              "https://www.michaelpage.com/sites/michaelpage.com/files/styles/advice_node_desktop/public/legacy/Top%25206%2520Construction%2520Project%2520Challenges.jpg?itok=3r1nPFqF"),
                                          fit: BoxFit.cover)),
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Construction\nWork",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context) / 2,
                child: InkWell(
                  onTap: () {
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
                        "Enquire Now",
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
