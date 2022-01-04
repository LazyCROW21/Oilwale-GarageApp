import 'dart:convert';
import 'package:garage_app/models/order.dart';

import 'package:http/http.dart' as http;

const String base_url = "https://oilwale.herokuapp.com/api";

class OrderAPIManager {
  static Future<List<Order>> getGarageOrders(String garageId) async {
    List<Order> orders = [];
    try {
      var client = http.Client();
      String urlStr = base_url + "/order/garage/" + garageId;
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          orders.add(Order.fromJSON(element));
          print(element);
        });
      }
      return orders;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return orders;
  }
}