import 'dart:convert';
import 'package:garage_app/models/offer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String base_url = "https://oilwale.herokuapp.com/api";

class OffersAPIManager {
  // return list of Offers on success or false on error
  static Future<dynamic> getAllActiveScheme() async {
    List<Offer> offers = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return offers;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      // 'Content-Type': 'application/json'
    };
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/active";
      var url = Uri.parse(urlStr);
      var response = await client.get(url, headers: reqHeader);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          offers.add(Offer.fromJSON(element));
          print(element);
        });
      }
      return offers;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return offers;
  }

  // return List of Offers for target group customer on success or else empty List
  static Future<List<Offer>> getActiveCustomerSchemes() async {
    List<Offer> offers = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return offers;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      // 'Content-Type': 'application/json'
    };
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/active/customers";
      var url = Uri.parse(urlStr);
      var response = await client.get(url, headers: reqHeader);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          offers.add(Offer.fromJSON(element));
          print(element);
        });
      }
      return offers;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return offers;
  }

  // return List of upcoming Offers for target group customer on success or else empty List
  static Future<List<Offer>> getUpComingCustomerSchemes() async {
    List<Offer> offers = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return offers;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      // 'Content-Type': 'application/json'
    };
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/upcoming/customers";
      var url = Uri.parse(urlStr);
      var response = await client.get(url, headers: reqHeader);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          offers.add(Offer.fromJSON(element));
          print(element);
        });
      }
      return offers;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return offers;
  }

  static Future<bool> isOfferAccepted(String garageId, String schemeId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String authToken = preferences.getString('token') ?? '';
    if (authToken == '') {
      return false;
    }
    Map<String, String> reqHeader = {
      'Authorization': 'Bearer $authToken',
      // 'Content-Type': 'application/json'
    };

    try {
      var client = http.Client();
      String urlStr = base_url +
          "/scheme/schemeId/GarageId/" +
          Uri.encodeComponent(schemeId) +
          "/" +
          Uri.encodeComponent(garageId);
      var url = Uri.parse(urlStr);
      var response = await client.get(url, headers: reqHeader);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        return jsonMap["isAccepted"];
      } else {
        return false;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }

  static Future<bool> offerAccept(
      bool accepted, String garageId, String schemeId) async {
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
      String urlStr = base_url + "/scheme/accept";
      Map<String, dynamic> offerAcceptData = {
        'accepted': accepted,
        'garageId': garageId,
        'schemeId': schemeId,
      };
      String dataString = jsonEncode(offerAcceptData);
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
