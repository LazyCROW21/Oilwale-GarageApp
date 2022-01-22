import 'package:mechanic_mart/models/product.dart';

class Order {
  late String orderId;
  late List<Product> productList;
  late int status;
  late String? placedAt;
  late String? acceptedAt;

  Order(
      {
        required this.orderId,
        required this.productList,
        required this.status,
        this.acceptedAt,
        this.placedAt
      }
      );

  Order.fromJSON(Map<String, dynamic> json)
  {
    this.orderId = json['orderId'];
    List products = json['product'] ?? [ ];
    this.productList =[ ];
    this.status = json['status'];
    this.placedAt = json['placedAt'];
    this.acceptedAt = json['acceptedAt'];
    for (int i = 0; i < products.length; i++) {
      productList.add(Product.fromJSON(products[i]));
    }
  }

}