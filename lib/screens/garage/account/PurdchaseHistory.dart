import 'package:flutter/material.dart';
import 'package:garage_app/models/offer.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryState createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  late Offer offers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Oilwale",
            style: TextStyle(color: Colors.white),
          ),
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: Container(
            // child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: CatalogModel.offers.length,
            //     itemBuilder: (context, index) {
            //       return PurchasedProductWidget(
            //         offers: CatalogModel.offers[index],
            //       );
            //     }),
            ));
  }
}
