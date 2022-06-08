import 'package:flutter/cupertino.dart';

class ServiceProvider with ChangeNotifier {
  String headerTitle = "";
  String imagePath = "";
  String content = "";

  void setData(String header, String cnt, String path) {
    this.headerTitle = header;
    this.content = cnt;
    this.imagePath = path;
    notifyListeners();
  }

  
  get getHeader => headerTitle;

  get getImagePath => imagePath;

  get getContent => content;
}
