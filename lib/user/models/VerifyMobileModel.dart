

class VerifyMobileModel {
  VerifyMobileModel({
    required this.token,
  });

  String token;

  factory VerifyMobileModel.fromMap(Map<String, dynamic> json) => VerifyMobileModel(
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
  };
}