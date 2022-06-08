// To parse this JSON data, do
//
//     final financePojo = financePojoFromJson(jsonString);
import 'dart:convert';

String financePojoToJson(FinancePojo data) => json.encode(data.toJson());

class FinancePojo {
  FinancePojo(
      {
        required this.id,
        required this.name,
      required this.typeOfObject,
      required this.aadharNumber,
      required this.address,
      required this.pincode,
      required this.pancard,
      required this.dob,
      required this.customerContactNumber,
      required this.nomineeName,
      required this.nomineeRelation,
      required this.nomineeNumber,
      required this.loanAmount,
      required this.type,
      required this.leadFrom});
  String id;
  String name;
  String typeOfObject;
  String aadharNumber;
  String address;
  String pincode;
  String pancard;
  String dob;
  String customerContactNumber;
  String nomineeName;
  String nomineeRelation;
  String loanAmount;
  String nomineeNumber;
  String type;
  String leadFrom;

  Map<String, dynamic> toJson() => {
        "id":id,
        "Customer Name": name,
        "Type of Loan": typeOfObject,
        "Aadhar Number": aadharNumber,
        "Address": address,
        "Pincode": pincode,
        "PAN Card": pancard,
        "Date of birth": dob,
        "Customer Mobile Number": customerContactNumber,
        "Nominee Name": nomineeName,
        "Nominee Relation": nomineeRelation,
        "Nominee Contact Number": nomineeNumber,
        "Loan Amount": loanAmount,
        "Type Of Service": type,
        "Lead From": leadFrom
      };
}
