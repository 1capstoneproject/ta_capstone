class Transaction {
  String transaction_code;
  String order_date;
  int tourism_id;
  String status;
  int user_id;
  dynamic payment;
  String visit_date;

  Transaction({
    required this.transaction_code,
    required this.order_date,
    required this.tourism_id,
    required this.status,
    required this.user_id,
    required this.payment,
    required this.visit_date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transaction_code: json['transaction_id'],
      order_date: json['order_date'],
      tourism_id: json['tourism_id'],
      status: json['status'],
      user_id: json['user_id'],
      payment: json['payment'],
      visit_date: json['visit_date'],
    );
  }
}
