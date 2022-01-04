import 'package:flutter/material.dart';
import 'package:garage_app/components/showproductstile.dart';
import 'package:garage_app/models/order.dart';

class ShowProductbought extends StatelessWidget {
  ShowProductbought({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final Order order = ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Card(
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Id - ${order.orderId}",
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 5.0,),
              Divider(height: 4.0,color: Colors.grey[600],),
              SizedBox(
                height: 15.0,
              ),
              Text("Date and Time of Purchase",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0,color: Colors.deepOrange)),
              SizedBox(
                height: 5.0,
              ),
              Text("${order.placedAt.substring(0,10)}   ${order.placedAt.substring(11,16)}",style: TextStyle(fontSize: 13.0),),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Expanded(
                  child: ListView.builder( itemCount: order.productList.length,
                      itemBuilder: (context, index) {
                        return ShowProductsTile(
                          product: order.productList[index],
                        );
                      })
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
