import 'dart:convert';

class SolarPojo {
  String name;
  String consumerNumber;
  String address;
  String mobileNumber;
  String emailAddress;
  String typeOfRoof;
  String shopsCount;
  String type;

  SolarPojo(
      {required this.name,
      required this.consumerNumber,
      required this.address,
      required this.mobileNumber,
      required this.emailAddress,
      required this.typeOfRoof,
      required this.shopsCount,
      required this.type});

  Map<String, dynamic> toJson() => {
        "Customer Name": name,
        "Consumer Number": consumerNumber,
        "Address": address,
        "Mobile Number": mobileNumber,
        "Email Address": emailAddress,
        "Type of Roof": typeOfRoof,
        "Number of Shops or Houses ": shopsCount,
        "Type Of Service":type
      };
}

String solarPojoToJson(SolarPojo data) => json.encode(data.toJson());
