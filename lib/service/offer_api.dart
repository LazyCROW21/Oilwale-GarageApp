import 'dart:convert';
import 'package:garage_app/models/offer.dart';
import 'package:http/http.dart' as http;

const String base_url = "https://oilwale.herokuapp.com/api";

class OffersAPIManager {
  // return list of Offers on success or false on error
  static Future<dynamic> getAllActiveScheme() async {
    List<Offer> offers = [];
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/active";
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
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
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/active/customers";
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
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
    try {
      var client = http.Client();
      String urlStr = base_url + "/scheme/upcoming/customers";
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
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

  static Future<bool> OfferAccept(bool accepted, String garageId,String schemeId) async {
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
      var response = await client.post(url,
          body: dataString, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        // Garage garagedetail =
        // await GarageAPIManager.getGarageForLogin(jsonMap['id']);
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // preferences.setString('token', jsonMap['token']);
        // preferences.setString('role', 'garage');
        // print(garagedetail);
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
