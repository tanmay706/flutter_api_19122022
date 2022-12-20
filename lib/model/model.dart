class TransactionDetails {
  final String avatar;
  final String name;
  final String date;
  final String amount;

  TransactionDetails(
      {required this.avatar,
      required this.name,
      required this.date,
      required this.amount});

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
        avatar: json['avatar'],
        name: json['name'],
        date: json['date'],
        amount: json['amount']);
  }

  static List<TransactionDetails> fromJsonList(dynamic jsonList) {
    final transactionDetailsList = <TransactionDetails>[];
    if (jsonList == null) return transactionDetailsList;

    if (jsonList is List<dynamic>) {
      for (final json in jsonList) {
        transactionDetailsList.add(
          TransactionDetails.fromJson(json),
        );
      }
    }

    return transactionDetailsList;
  }
}
