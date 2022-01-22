import 'package:flutter/material.dart';
import 'package:mechanic_mart/models/customer.dart';

class CustomerDisplayWidget extends StatelessWidget {
  const CustomerDisplayWidget({Key? key,required this.customer}) : super(key: key);
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 50.0,
                width: 50.0,
                margin: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.local_offer_rounded,
                  color: Colors.deepOrange,
                ),
              ),
            ),
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
                      TextStyle(fontSize: 12.0, color: Colors.deepOrange),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
