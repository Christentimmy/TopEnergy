class UserModel {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String phoneNumber;
  final String? role;
  final String type;
  final String? referralCode;
  final String otpCode;
  final dynamic isAuth;
  final String pin;
  final dynamic isPin;
  final String token;
  final String accoutBalance;
  final String accoutnCommission;
  final String active;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phoneNumber,
    required this.role,
    required this.type,
    required this.referralCode,
    required this.otpCode,
    required this.isAuth,
    required this.pin,
    required this.isPin,
    required this.token,
    required this.accoutBalance,
    required this.accoutnCommission,
    required this.active,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      emailVerifiedAt:
          json['email_verified_at'] != null ? json["email_verified_at"] : "",
      phoneNumber: json["phone_number"] ?? "",
      role: json["role"] ?? "",
      type: json["type"] ?? "",
      referralCode: json['referral_code'] ?? "",
      otpCode: json['otp_code'] ?? "",
      isAuth: json["isAuth"] ?? "",
      pin: json['pin'] ?? "0",
      isPin: json['isPin'] ?? "",
      token: json['token'] ?? "",
      accoutBalance: json["acct_balance"] ?? "",
      accoutnCommission: json["acct_commision"] ?? "",
      active: json["active"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'phone_number': phoneNumber,
      'role': role,
      'type': type,
      'referral_code': referralCode,
      'otp_code': otpCode,
      'isAuth': isAuth,
      'pin': pin,
      'isPin': isPin,
      'token': token,
      "active": active,
    };
  }
}
