
class VerificationResponseBody {
  String customerName;
  String address;
  String meterNumber;
  String accountNumber;
  String businessUnit;
  String serviceHub;
  double minimumPurchase;
  String tariffcode;
  double customerArrears;
  String tariff;
  String kct1;
  String kct2;
  bool isMd;
  int transactionId;
  String customerPhone;

  VerificationResponseBody({
    required this.customerName,
    required this.address,
    required this.meterNumber,
    required this.accountNumber,
    required this.businessUnit,
    required this.serviceHub,
    required this.minimumPurchase,
    required this.tariffcode,
    required this.customerArrears,
    required this.tariff,
    required this.kct1,
    required this.kct2,
    required this.isMd,
    required this.transactionId,
    required this.customerPhone,
  });

  factory VerificationResponseBody.fromJson(Map<String, dynamic> json) {
    return VerificationResponseBody(
      customerName: json['customerName'] ?? '',
      address: json['address'] ?? '',
      meterNumber: json['meterNumber'] ?? '',
      accountNumber: json['accountNumber'] ?? '',
      businessUnit: json['businessUnit'] ?? '',
      serviceHub: json['serviceHub'] ?? '',
      minimumPurchase: (json['minimumPurchase'] ?? 0.0).toDouble(),
      tariffcode: json['tariffcode'] ?? '',
      customerArrears: (json['customerArrears'] ?? 0.0).toDouble(),
      tariff: json['tariff'] ?? '',
      kct1: json['kct1'] ?? '',
      kct2: json['kct2'] ?? '',
      isMd: json['isMd'] ?? false,
      transactionId: json['transaction_id'] ?? 0,
      customerPhone: json['customerPhone'] ?? '',
    );
  }
}