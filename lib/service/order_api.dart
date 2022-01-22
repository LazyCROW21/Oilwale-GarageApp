import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mechanic_mart/models/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String base_url = "https://oilwale.herokuapp.com/api";

class OrderAPIManager {
  static Future<List<Order>> getGarageOrders(String garageId) async {
    List<Order> orders = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return orders;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      // 'Content-Type': 'application/json'
    };
    try {
      var client = http.Client();
      String urlStr = base_url + "/order/garage/" + garageId;
      var url = Uri.parse(urlStr);
      var response = await client.get(url, headers: reqHeader);
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

  static Future<bool> postOrderAccept(
      String garageId, Map<String, int> productList) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return false;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json'
    };
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
      var response =
          await client.post(url, body: dataString, headers: reqHeader);
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
