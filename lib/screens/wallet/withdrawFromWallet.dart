import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WithdrawFromWallet extends StatefulWidget {
  const WithdrawFromWallet({Key? key}) : super(key: key);

  @override
  _WithdrawFromWalletState createState() => _WithdrawFromWalletState();
}

class _WithdrawFromWalletState extends State<WithdrawFromWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Send Money to Bank"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Send Money From Wallet To Bank",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "10% Convenience and GST charges will be deducted from the amount",
                style: TextStyle(height: 1.6),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5)
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter Amount"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
