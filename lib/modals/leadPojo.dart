// To parse this JSON data, do
//
//     final leadPojo = leadPojoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LeadPojo leadPojoFromJson(String str) => LeadPojo.fromJson(json.decode(str));

String leadPojoToJson(LeadPojo data) => json.encode(data.toJson());

class LeadPojo {
  LeadPojo({
    required this.data,
  });

  List<Datum> data;

  factory LeadPojo.fromJson(Map<String, dynamic> json) => LeadPojo(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.customerName,
    required this.customerNumber,
    required this.customerAddress,
    required this.emailAddress,
    required this.residentialCategory,
    required this.completionStatus,
    required this.typeOfService,
    required this.id,
    required this.typeOfLoan,
    required this.aadharNumber,
    required this.address,
    required this.pincode,
    required this.panCard,
    required this.dateOfBirth,
    required this.customerMobileNumber,
    required this.nomineeName,
    required this.nomineeRelation,
    required this.nomineeContactNumber,
    required this.loanAmount,
    required this.leadFrom,
  });

  String customerName;
  dynamic customerNumber;
  dynamic customerAddress;
  dynamic emailAddress;
  dynamic residentialCategory;
  dynamic completionStatus;
  dynamic typeOfService;
  dynamic id;
  dynamic typeOfLoan;
  dynamic aadharNumber;
  dynamic address;
  dynamic pincode;
  dynamic panCard;
  dynamic dateOfBirth;
  dynamic customerMobileNumber;
  dynamic nomineeName;
  dynamic nomineeRelation;
  dynamic nomineeContactNumber;
  dynamic loanAmount;
  dynamic leadFrom;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        customerName: json["Customer Name"],
        customerNumber:
            json["Customer Number"] == null ? null : json["Customer Number"],
        customerAddress:
            json["Customer Address"] == null ? null : json["Customer Address"],
        emailAddress:
            json["Email Address"] == null ? null : json["Email Address"],
        residentialCategory: json["Residential Category"] == null
            ? null
            : json["Residential Category"],
        completionStatus: json["Completion Status"] == null
            ? null
            : json["Completion Status"],
        typeOfService: json["Type Of Service"],
        id: json["id"],
        typeOfLoan: json["Type of Loan"] == null ? null : json["Type of Loan"],
        aadharNumber:
            json["Aadhar Number"] == null ? null : json["Aadhar Number"],
        address: json["Address"] == null ? null : json["Address"],
        pincode: json["Pincode"] == null ? null : json["Pincode"],
        panCard: json["PAN Card"] == null ? null : json["PAN Card"],
        dateOfBirth:
            json["Date of birth"] == null ? null : json["Date of birth"],
        customerMobileNumber: json["Customer Mobile Number"] == null
            ? null
            : json["Customer Mobile Number"],
        nomineeName: json["Nominee Name"] == null ? null : json["Nominee Name"],
        nomineeRelation:
            json["Nominee Relation"] == null ? null : json["Nominee Relation"],
        nomineeContactNumber: json["Nominee Contact Number"] == null
            ? null
            : json["Nominee Contact Number"],
        loanAmount: json["Loan Amount"] == null ? null : json["Loan Amount"],
        leadFrom: json["Lead From"] == null ? null : json["Lead From"],
      );

  Map<String, dynamic> toJson() => {
        "Customer Name": customerName,
        "Customer Number": customerNumber == null ? "" : customerNumber,
        "Customer Address": customerAddress == null ? "" : customerAddress,
        "Email Address": emailAddress == null ? "" : emailAddress,
        "Residential Category":
            residentialCategory == null ? "" : residentialCategory,
        "Completion Status": completionStatus == null ? "" : completionStatus,
        "Type Of Service": typeOfService,
        "id": id,
        "Type of Loan": typeOfLoan == null ? "" : typeOfLoan,
        "Aadhar Number": aadharNumber == null ? "" : aadharNumber,
        "Address": address == null ? "" : address,
        "Pincode": pincode == null ? "" : pincode,
        "PAN Card": panCard == null ? "" : panCard,
        "Date of birth": dateOfBirth == null ? "" : dateOfBirth,
        "Customer Mobile Number":
            customerMobileNumber == null ? "" : customerMobileNumber,
        "Nominee Name": nomineeName == null ? "" : nomineeName,
        "Nominee Relation": nomineeRelation == null ? "" : nomineeRelation,
        "Nominee Contact Number":
            nomineeContactNumber == null ? "" : nomineeContactNumber,
        "Loan Amount": loanAmount == null ? "" : loanAmount,
        "Lead From": leadFrom == null ? "" : leadFrom,
      };
}

Datum datumFromJson(String str) => Datum.fromJson(json.decode(str));

String datumToJson(Datum data) => json.encode(data.toJson());
