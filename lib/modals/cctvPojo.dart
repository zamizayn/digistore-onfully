import 'dart:convert';

class CCTVPojo {
  String name;
  String address;
  String mobileNumber;
  String email;
  String residential_category;
  String completion_status;
  String type;

  CCTVPojo(
      {required this.name,
      required this.address,
      required this.mobileNumber,
      required this.email,
      required this.residential_category,
      required this.completion_status,
      required this.type
      });

        Map<String, dynamic> toJson() => {
        "Customer Name": name,
        "Customer Number": mobileNumber,
        "Customer Address": address,
       
        "Email Address": email,
        "Residential Category": residential_category,
        "Completion Status": completion_status,
        "Type Of Service":type
      };
}

String cctvPojoToJson(CCTVPojo data) => json.encode(data.toJson());