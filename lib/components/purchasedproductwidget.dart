import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/models/order.dart';


class PurchasedProductWidget extends StatefulWidget {
  PurchasedProductWidget({Key? key, required this.orders}) : super(key: key);
  final Order orders;

  @override
  State<PurchasedProductWidget> createState() => _PurchasedProductWidgetState();
}

class _PurchasedProductWidgetState extends State<PurchasedProductWidget> {
  String message = "placed";

  Color msgcolor = Colors.grey[900]!.withOpacity(1);

  Color backgroundMssgColor = Colors.yellowAccent;

  @override
  void initState() {
    super.initState();
    if(widget.orders.status == 0){
      backgroundMssgColor = Colors.yellow;
      message = "placed";
    }
    else if(widget.orders.status == 1){
      backgroundMssgColor = Colors.green;
      message ="accepted";
    }
    else if(widget.orders.status == 2 || widget.orders.status == 3){
      backgroundMssgColor = Colors.grey;
      message ="delivered";
    }
    else if(widget.orders.status == 4){
      backgroundMssgColor = Colors.black;
      message = "not accepted";
      msgcolor = Colors.white;
    }
    else {
      backgroundMssgColor = Colors.black;
      message ="deleted";
      msgcolor = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/purchased_product',arguments: widget.orders);
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
          child: Card(
            elevation: 2.0,
            child: Stack(
              children: [
                Positioned(
                    top: 5.0,
                    right: 5.0,
                    child: Text(
                      widget.orders.placedAt != null ? widget.orders.placedAt!.substring(0,10)  : " koi bhi date " ,
                      style: TextStyle(fontSize: 12.0),
                    )),
                Positioned(
                  height: 30,
                  top: 23.0,
                  right: 10.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      message,
                      style: TextStyle(color: msgcolor),
                    ),
                    style: TextButton.styleFrom(backgroundColor: backgroundMssgColor),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  margin: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.deepOrange,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Text(
                              "${widget.orders.productList.length} products",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
