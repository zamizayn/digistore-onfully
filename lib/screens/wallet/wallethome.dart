import 'package:digistoreapp/helpers/helper.dart';
import 'package:digistoreapp/screens/wallet/withdrawFromWallet.dart';
import 'package:flutter/material.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({Key? key}) : super(key: key);

  @override
  _WalletHomeState createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Account Details"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/images/balance.png",
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  "DigiWallet Balance",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Text(
                  "Rs. 0",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  thickness: 1,
                ),
              ),
              ListTile(
                  onTap: () {
                    navigate(context, WithdrawFromWallet());
                  },
                  leading: Image.asset(
                    "assets/images/withdrawal.jpg",
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    "Withdrawals",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(Icons.chevron_right)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  thickness: 1,
                ),
              ),
              ListTile(
                  leading: Image.asset(
                    "assets/images/banks.png",
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    "Bank Accounts",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(Icons.chevron_right)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Added Rs. 1000 to your wallet on successfull referal",
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: Image.asset(
                        "assets/images/balance.png",
                        width: 30,
                        height: 30,
                      ),
                      trailing: Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.blue,
                      ),
                    );
                  },
                  separatorBuilder: (context, newindex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                        thickness: 1,
                      ),
                    );
                  },
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }
}
