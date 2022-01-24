import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mechanic_mart/components/customerlistwidget.dart';
import 'package:mechanic_mart/models/customer.dart';
import 'package:mechanic_mart/service/garage_api.dart';
import 'package:mechanic_mart/theme/themedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late final String garageId;
  List<Customer> _customerList = [];
  late Customer customer;
  bool isLoading = true;
  SpinKitRing loadingRing = SpinKitRing(
    color: AppColorSwatche.primary,
  );
  @override
  void initState() {
    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";
      print(garageId);
      GarageAPIManager.getAllCustomers(garageId).then((resp) {
        setState(() {
          _customerList = resp;
          isLoading = false;
        });
      }).onError((error, stackTrace) {
        print(error);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Listed Customers"),
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: isLoading
              ? loadingRing
              : ListView.builder(
                  itemCount: _customerList.length,
                  itemBuilder: (context, index) {
                    return CustomerDisplayWidget(
                      customer: _customerList[index],
                    );
                  }),
        ));
  }
}
