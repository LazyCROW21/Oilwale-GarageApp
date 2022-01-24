import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mechanic_mart/components/purchasedproductwidget.dart';
import 'package:mechanic_mart/models/order.dart';
import 'package:mechanic_mart/service/order_api.dart';
import 'package:mechanic_mart/theme/themedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryState createState() => _PurchaseHistoryState();
}


class _PurchaseHistoryState extends State<PurchaseHistory> {
  late Order orders;
  List<Order> _orderList = [];
  String garageId = "";
  late SharedPreferences sp;
  // bool _orderEmpty = false;
  bool isloading = true;
  SpinKitRing loadingRing = SpinKitRing(
    color: AppColorSwatche.primary,
  );

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";

      OrderAPIManager.getGarageOrders(garageId).then((resp) {
        setState(() {
          _orderList = resp;
          _orderList = _orderList.reversed.toList();
          isloading = false;
          if (_orderList.isEmpty) {
            // _orderEmpty = true;
          }
        }
        );
      }).onError((error, stackTrace) {
        print(error);
      });
    }
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Orders",
            style: TextStyle(color: Colors.white),
          ),
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: Container(
            child: isloading ?
            loadingRing :
                RefreshIndicator(onRefresh: () {
                  return OrderAPIManager.getGarageOrders(garageId).then((resp) {
                  setState(() {
                    _orderList = resp;
                    _orderList = _orderList.reversed.toList();
                    if (_orderList.isEmpty) {
                      // _orderEmpty = true;
                    }
                  }
                  );
                }).onError((error, stackTrace) {
                  print(error);
                });
                  },
                child:
            ListView.builder(
                shrinkWrap: true,
                itemCount: _orderList.length,
                itemBuilder: (context, index) {
                  return PurchasedProductWidget(
                    orders:_orderList[index],
                  );
                }),)
            ));
  }
}

