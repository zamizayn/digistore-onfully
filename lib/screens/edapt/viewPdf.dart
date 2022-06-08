
import 'package:digistoreapp/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatefulWidget {
  const ViewPdf({Key? key}) : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(context),
              child: SfPdfViewer.asset(
                "assets/images/edaptcontent.pdf",
                canShowScrollStatus: true,
                scrollDirection: PdfScrollDirection.vertical,
                canShowScrollHead: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
