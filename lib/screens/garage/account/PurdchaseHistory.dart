import 'package:flutter/material.dart';
import 'package:garage_app/components/purchasedproductwidget.dart';
import 'package:garage_app/models/order.dart';
import 'package:garage_app/service/order_api.dart';
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
  bool _orderEmpty = false;

  // void callb() async{
  //
  //
  //     } );
  // }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";

      OrderAPIManager.getGarageOrders(garageId).then((resp) {
        setState(() {
          _orderList = resp;
          _orderList = _orderList.reversed.toList();
          if (_orderList.isEmpty) {
            _orderEmpty = true;
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _orderList.length,
                itemBuilder: (context, index) {
                  return PurchasedProductWidget(
                    orders:_orderList[index],
                  );
                }),
            ));
  }
}

