class TransactionModel {
  final String referenceId;
  final String transactionId;
  final String number;
  final String amount;
  final String token;
  final String meterNumber;
  final String units;
  final String billType;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransactionModel({
    required this.referenceId,
    required this.transactionId,
    required this.number,
    required this.amount,
    required this.token,
    required this.meterNumber,
    required this.units,
    required this.billType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      referenceId: json["reference_id"] ?? "",
      transactionId: json["transaction_id"] ?? "",
      number: json["number"] ?? "",
      amount: json["amount"] ?? "",
      token: json["token"] ?? "",
      meterNumber: json["meter_number"] ?? "",
      units: json["units"] ?? "",
      billType: json["bill_type"] ?? "",
      status: json["status"] ?? "",
      createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
      updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
    );
  }
}
