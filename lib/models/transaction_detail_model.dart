class TransactionDetailModel {
  int transaction_id;
  int product_id;
  String product_name;
  String product_image;
  int quantity;
  double price;

  TransactionDetailModel({
    required this.transaction_id,
    required this.product_id,
    required this.product_name,
    required this.product_image,
    required this.quantity,
    required this.price,
  });

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailModel(
      transaction_id: json['transaction_id'],
      product_id: json['product_id'],
      product_name: json['product_name'],
      product_image: json['product_image'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
