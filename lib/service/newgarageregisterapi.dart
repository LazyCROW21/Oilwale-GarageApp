import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String base_url = "https://oilwale.herokuapp.com/api";

class NewGarageRegisterApiManager {
  static Future<bool> newGarageAccept(
      String address, String fullName, String phoneNumber) async {
    try {
      String urlStr = base_url + "/newGarage";
      Map<String, dynamic> offerAcceptData = {
        'address': address,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
      };
      String dataString = jsonEncode(offerAcceptData);
      var client = http.Client();
      var url = Uri.parse(urlStr);
      print(dataString);
      var response =
          await client.post(url,headers: <String,String>{'Content-Type' : 'application/json; charset=UTF-8'}, body: dataString);
      print(response.statusCode);
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
