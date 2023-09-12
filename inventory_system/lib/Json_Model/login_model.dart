class LoginModel {
  int? uID;
  String? email;
  String? password;
  String? inchargeOf;

  LoginModel({this.uID, this.email, this.password, this.inchargeOf});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    uID: json["UID"],
    email: json["Email"],
    password: json["Password"],
    inchargeOf: json["InchargeOf"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UID'] = this.uID;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['InchargeOf'] = this.inchargeOf;
    return data;
  }
}
