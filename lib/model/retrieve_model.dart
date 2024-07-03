class RetrieveBody {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String type;
  final String otpCode;
  final String pin;
  final String acctBalance;
  final String acctCommission;

  RetrieveBody({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.type,
    required this.otpCode,
    required this.pin,
    required this.acctBalance,
    required this.acctCommission,
  });

  factory RetrieveBody.fromJson(Map<String, dynamic> json) {
    return RetrieveBody(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      type: json['type'],
      otpCode: json['otp_code'],
      pin: json['pin'],
      acctBalance: json['acct_balance'],
      acctCommission: json['acct_commision'],
    );
  }
}