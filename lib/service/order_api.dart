import 'dart:convert';
import 'package:garage_app/models/order.dart';
import 'package:garage_app/models/product.dart';

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

  static Future<bool> postOrderAccept(String garageId,Map<String,int> productList)  async {
    try {
      String urlStr = base_url + "/order";
      Map<String, dynamic> orderAcceptData = {
        'garageId': garageId,
        'products': productList,
      };
      String dataString = jsonEncode(orderAcceptData);
      var client = http.Client();
      var url = Uri.parse(urlStr);
      print(dataString);
      var response = await client.post(url,
          body: dataString, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }
}