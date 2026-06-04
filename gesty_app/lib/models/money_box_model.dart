class MoneyBoxModel {
  int id;
  String name;
  double targetAmount;
  double? amountInBox;

  MoneyBoxModel({
    required this.id,
    required this.name,
    required this.targetAmount,
    this.amountInBox,
  });
  
  factory MoneyBoxModel.fromJson(Map<String, dynamic> json) {
    return MoneyBoxModel(
      id: json['id'],
      name: json['name'],
      targetAmount: json['targetAmount'].toDouble(),
      amountInBox: json['amountInBox'] != null ? json['amountInBox'].toDouble() : 0,
    );
  }

}