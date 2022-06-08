import 'dart:developer';

import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:digistoreapp/screens/cctvData/cctvDataSubmission.dart';
import 'package:digistoreapp/screens/solar/solarDataSubmission.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class ServiceDetail extends StatefulWidget {
  final String videoId;
  final String serviceId;

  @override
  _ServiceDetailState createState() => _ServiceDetailState();

  ServiceDetail({required this.videoId, required this.serviceId});
}

class _ServiceDetailState extends State<ServiceDetail> {
  YoutubePlayerController? _controller;

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
    Future.delayed(Duration(seconds: 0), () {
      // Provider.of<ReferalProvider>(context, listen: false)
      //     .getRegisterStatus(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.close();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ServiceProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              // navigate(context, DigiStoreMessage());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.message),
            ),
          )
        ],
        backgroundColor: Colors.green,
        title: Text(data.headerTitle),
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
                    data.imagePath,
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
                                data.headerTitle,
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
                  data.content,
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
                width: getWidth(context) / 2,
                child: InkWell(
                  onTap: () {
                    if (data.headerTitle.toLowerCase() == "solar kit") {
                      navigate(context, SolarDataSubmission());
                    } else if (data.headerTitle.toLowerCase() ==
                        "cctv security system") {
                      navigate(context, CCTVSubmission());
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
