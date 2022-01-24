import 'package:flutter/material.dart';
import 'package:mechanic_mart/models/customer.dart';

class CustomerDisplayWidget extends StatelessWidget {
  const CustomerDisplayWidget({Key? key, required this.customer})
      : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4.0,
        // margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.person,color: Colors.deepOrange,))),
            Expanded(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      customer.customerName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    Text(
                      customer.customerPhoneNumber,
                      style:
                          TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
