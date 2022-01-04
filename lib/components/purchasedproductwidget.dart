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
      backgroundMssgColor = Colors.grey;
      message = "placed";
    }
    else if(widget.orders.status == 1){
      backgroundMssgColor = Colors.yellow;
      message ="seen";
    }
    else if(widget.orders.status == 2){
      backgroundMssgColor = Colors.green;
      message ="accepted";
    }
    else{
      backgroundMssgColor = Colors.black;
      message = "delivered";
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
          child: Card(
            elevation: 2.0,
            child: Stack(
              children: [
                Positioned(
                    top: 5.0,
                    right: 5.0,
                    child: Text(
                      widget.orders.placedAt.substring(0,10),
                      style: TextStyle(fontSize: 12.0),
                    )),
                Positioned(
                  height: 30,
                  top: 23.0,
                  right: 10.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "${message}",
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
                              "${widget.orders.productList.length} products purchased",
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
