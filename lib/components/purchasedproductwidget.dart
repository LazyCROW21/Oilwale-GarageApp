import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/models/order.dart';


class PurchasedProductWidget extends StatelessWidget {
  PurchasedProductWidget({Key? key, required this.orders}) : super(key: key);
  final Order orders;
  final message = "placed";
  final Color msgcolor = Colors.grey[900]!.withOpacity(1);
  final Color bckgrndmsgcolor = Colors.yellowAccent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/purchased_product');
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
                      orders.placedAt,
                      style: TextStyle(fontSize: 12.0),
                    )),
                Positioned(
                  top: 15.0,
                  right: 10.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "${orders.status}",
                      style: TextStyle(color: msgcolor),
                    ),
                    style: TextButton.styleFrom(backgroundColor: bckgrndmsgcolor),
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
                              "4 Products Purchased",
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
