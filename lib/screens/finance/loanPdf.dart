import 'package:digistoreapp/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LoanPdf extends StatefulWidget {
  const LoanPdf({Key? key}) : super(key: key);

  @override
  State<LoanPdf> createState() => _LoanPdfState();
}

class _LoanPdfState extends State<LoanPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(context),
              child: SfPdfViewer.asset(
                "assets/images/loanpdf.pdf",
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
