import 'package:digistoreapp/helpers/helper.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({required this.type});
  final String type;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(widget.type),
      body: Container(
        color: Colors.black,
        child: widget.type == "OnEducation"
            ? oneduWidgets(context)
            : widget.type == "OnSoftware"
                ? onsoftwareWidgets(context)
                : widget.type == "OnHealth"
                    ? onHealthWidgets(context)
                    : widget.type == "OnRealtor"
                        ? realtorWidget(context)
                        : widget.type == "OnFinance"
                            ? onfinanceWidgets(context)
                            : widget.type == "OnMarketing"
                                ? onmarketingWidgets(context)
                                : insuranceWidget(context),
      ),
    );
  }
}
