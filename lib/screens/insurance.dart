import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/providers/serviceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class OnInSurance extends StatefulWidget {
  final String videoId;
  final String serviceId;
  OnInSurance({required this.videoId, required this.serviceId});
  @override
  _OnInSuranceState createState() => _OnInSuranceState();
}

class _OnInSuranceState extends State<OnInSurance> {
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
      body: SingleChildScrollView(
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
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy-gsLSSGn20TCqjFBbHTCW36TJ68u3wsC8Q&usqp=CAU"),
                                        fit: BoxFit.cover)),
                                child: Text(""),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "General\nInsurance",
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
                                color: index == 1 ? Colors.green : Colors.white,
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
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4X-p-nz58xvAMz66YJLEateUe6z_nL4Fsmg&usqp=CAU"),
                                          fit: BoxFit.cover)),
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Health\nInsurance",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOYgqfheHoCav9QiLp610iN0vYn-3kwHRm0Q&usqp=CAU"),
                                        fit: BoxFit.cover)),
                                child: Text(""),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Vehicle\nInsurance",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
