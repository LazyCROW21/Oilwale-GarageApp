import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/models/offer.dart';
import 'package:garage_app/widgets/OffersWidget.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offer offers = ModalRoute
        .of(context)!
        .settings
        .arguments as Offer;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3.0,
        centerTitle: true,
        title: Text(
          "Oilwale",
          style: TextStyle(color: Colors.deepOrange),
        ),
        leading: BackButton(
          color: Colors.deepOrange,
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Card(
          shadowColor: Colors.deepOrangeAccent,
          borderOnForeground: true,
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  offers.schemeName.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.deepOrangeAccent),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    "10 rupiye ki pepsi , mera description secsi wagfw aFwf wsfiawref iafwref ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            "Last Date:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(offers.endsAt.substring(0, 10)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(child: ListView.builder(
                    itemCount: offers.productList.length,
                    itemBuilder: (context, index) {
                      return OffersProductTile(product: offers.productList[index]);
                    })),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, '/garage_offers');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green[100]!.withOpacity(0.5),
                        ),
                        child: Text(
                          "Accept",
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OffersProductTile {
}
