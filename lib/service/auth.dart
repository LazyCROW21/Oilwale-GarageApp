import 'dart:convert';
import 'package:garage_app/models/garage.dart';
import 'package:garage_app/service/garage_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String base_url = "https://oilwale.herokuapp.com/api";

class AuthManager {
  // return bool on successful login or false on error
  static Future<bool> login(String phone, String pwd) async {
    try {
      String urlStr = base_url + "/authenticate";
      Map<String, String> loginData = {
        'id': phone,
        'password': pwd,
        'role': 'garage'
      };
      String dataString = jsonEncode(loginData);
      var client = http.Client();
      var url = Uri.parse(urlStr);
      print(dataString);
      var response = await client.post(url,
          body: dataString, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        Garage garagedetail =
            await GarageAPIManager.getGarageForLogin(jsonMap['id']);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('token', jsonMap['token']);
        preferences.setString('role', 'garage');
        print(garagedetail);
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

  // return bool on successful logout or false on error
  static Future<bool> logout(String phone, String pwd, bool customer) async {
    try {
      // String urlStr = base_url + "/authenticate";
      // if (customer) {
      // Map<String, String> loginData = {
      //   'id': phone,
      //   'password': pwd,
      //   'role': 'customer'
      // };
      // String dataString = jsonEncode(loginData);
      // var client = http.Client();
      // var url = Uri.parse(urlStr);
      // print(dataString);
      // var response = await client.post(url,
      //     body: dataString, headers: {'Content-Type': 'application/json'});
      // if (response.statusCode == 200) {
      //   var jsonString = response.body;
      //   Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      //   print(jsonMap);
      //   Customer customerdetail =
      //       await CustomerAPIManager.getCustomerDetail(jsonMap['id']);

      // } else {

      // }
      // } else {
      // return true;
      // }
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }
}
