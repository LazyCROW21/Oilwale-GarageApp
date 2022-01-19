import 'package:flutter/material.dart';
import 'package:garage_app/components/offerwidget.dart';
import 'package:garage_app/models/customer.dart';
import 'package:garage_app/service/garage_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late final String garageId;
  List<Customer> _custlist = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";
      GarageAPIManager.getAllCustomers(garageId).then((resp){
        _custlist = resp;
        isloading = false;
      }).onError((error, stackTrace){
        print(error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Listed Customers"),
      ),
      // body: Container(
      //   padding: EdgeInsets.all(10.0),
      //   child: SingleChildScrollView(
      //       // child: ListView.builder(itemBuilder: (context, index) {
      //     // return OffersWidget(offers: offers);
      //   })),
      );
  }
}
