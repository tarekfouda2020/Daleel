class UpdateUserModel{
  String? mobile;
  String? email;
  String? name;
  String? accountNumber;
  String? city;

  UpdateUserModel({
    this.mobile,
    this.email,
    this.name,
    this.accountNumber,
    this.city,
  });

  Map<String, dynamic> toJson()=>{
    "name":name,
    "email":email,
    "mobile":mobile,
    "account_number":accountNumber,
    "city":city,
  };

}