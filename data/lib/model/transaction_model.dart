class TransactionList {
  final List<TransactionModel> list;

  TransactionList(this.list);

  factory TransactionList.fromJson(dynamic json) {
    List<TransactionModel> data = List.empty(growable: true);
    if (json['body'] != null) {
      json['body'].forEach((element) {
        data.add(TransactionModel.fromJson(element));
      });
    }
    return TransactionList(data);
  }
}

class TransactionModel {
  final int transactionId;
  final int customerId;
  final int storeId;
  final String storeName;
  final int branchId;
  final String geoDecodedAddress;
  final int salesmanId;
  final String salesmanName;
  final String transactionState;
  final List<String> imageUrl;
  final int amount;
  final int conversionRate;
  final int discount;
  final String posTransactionId;

  TransactionModel({
    this.transactionId = -1,
    this.customerId = -1,
    this.storeId = -1,
    this.storeName = '',
    this.branchId = -1,
    this.geoDecodedAddress = '',
    this.salesmanId = -1,
    this.salesmanName = '',
    this.transactionState = '',
    this.imageUrl = const [],
    this.amount = 0,
    this.conversionRate = 0,
    this.discount = 0,
    this.posTransactionId = '',
  });

  factory TransactionModel.fromJson(dynamic json) {
    return TransactionModel(
      transactionId: json['transactionId'],
      customerId: json['customerId'],
      storeId: json['storeId'],
      storeName: json['storeName'],
      branchId: json['branchId'],
      geoDecodedAddress: json['geoDecodedAddress'],
      salesmanId: json['salesmanId'],
      salesmanName: json['salesmanName'],
      transactionState: json['transactionState'],
      imageUrl: json['imageUrl'] != null ? json['imageUrl'].cast<String>() : [],
      amount: json['amount'],
      conversionRate: json['conversionRate'],
      discount: json['discount'],
      posTransactionId: json['posTransactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transactionId'] = transactionId;
    map['customerId'] = customerId;
    map['storeId'] = storeId;
    map['storeName'] = storeName;
    map['branchId'] = branchId;
    map['geoDecodedAddress'] = geoDecodedAddress;
    map['salesmanId'] = salesmanId;
    map['salesmanName'] = salesmanName;
    map['transactionState'] = transactionState;
    map['imageUrl'] = imageUrl;
    map['amount'] = amount;
    map['conversionRate'] = conversionRate;
    map['discount'] = discount;
    map['posTransactionId'] = posTransactionId;
    return map;
  }
}
