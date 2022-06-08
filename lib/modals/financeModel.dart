class FinanaceModel {
  static final String nameOfCustomer = "Name Of Customer";
  static final String aadharNo = "Aadhar Number";
  static final String fullAddress = "Address";
  static final String pincode = "Pincode";
  static final String pancard = "PAN Card No";
  static final String DOB = "Date Of Birth";
  static final String contactNo = "Contact Number";
  static final String loanAmount = "Loan Amount";
  static final String nominee = "Nominee";
  static final String date = "Date";
  static final String leadFrom = "Lead From";

  static List<String> getColumns() => [
        nameOfCustomer,
        aadharNo,
        fullAddress,
        pincode,
        pancard,
        DOB,
        contactNo,
        loanAmount,
        nominee,
        date,
        leadFrom
      ];
}
