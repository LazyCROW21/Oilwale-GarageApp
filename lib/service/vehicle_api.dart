import 'dart:convert';
import 'package:garage_app/models/vehicle.dart';
import 'package:garage_app/models/vehiclecompany.dart';
import 'package:http/http.dart' as http;

const String base_url = "https://oilwale.herokuapp.com/api";

class VehicleAPIManager {
  // return list of all Vehicle of specific Company on success or false on error
  static Future<List<Vehicle>> getVehiclesByCompanyId(String companyId) async {
    List<Vehicle> vehicles = [];
    try {
      var client = http.Client();
      String urlStr = base_url + "/vehicle/company/" + companyId;
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          vehicles.add(Vehicle.fromJSON(element));
          print(element);
        });
      }
      return vehicles;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return vehicles;
  }

  static Future<dynamic> getVehicle(String vehicleId) async {
    try {
      var client = http.Client();
      String urlStr = base_url + "/vehicle/" + vehicleId;
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        dynamic jsonMap = jsonDecode(jsonString);
        print(jsonMap['suggestedProductDetails']);
        return jsonMap;
      } else {
        return null;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return null;
  }

  // return list of all Vehicle Companies on success or false on error
  static Future<dynamic> getAllVehicleCompanies() async {
    try {
      var client = http.Client();
      String urlStr = base_url + "/getVehicleCompany";
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        List<VehicleCompany> vehicleCompanies = [];
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          vehicleCompanies.add(VehicleCompany.fromJSON(element));
          print(element);
        });
        return vehicleCompanies;
      } else {
        return false;
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return false;
  }

  // return list of vehicle that are recommended for the specified product
  static Future<List<Vehicle>> getRecommendedVehiclesByProductId(
      String productId) async {
    List<Vehicle> vehicles = [];
    try {
      var client = http.Client();
      String urlStr = base_url + "/vehicle/product/" + productId;
      var url = Uri.parse(urlStr);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List jsonMap = jsonDecode(jsonString);
        jsonMap.forEach((element) {
          vehicles.add(Vehicle.fromJSON(element));
          print(element);
        });
      }
      return vehicles;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    return vehicles;
  }
}
