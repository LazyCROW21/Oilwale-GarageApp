import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/models/offer.dart';
import 'package:garage_app/components/showproductstile.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offer offers = ModalRoute.of(context)!.settings.arguments as Offer;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 3.0,
        title: Text(
          "Order Details",
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Card(
        shadowColor: Colors.deepOrangeAccent,
        borderOnForeground: true,
        elevation: 0.0,
        child: Container(
          color: Colors.grey[100]!.withOpacity(.5),
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
              Expanded(
                  child: ListView.builder(
                      itemCount: offers.productList.length,
                      itemBuilder: (context, index) {
                        return ShowProductsTile(
                            product: offers.productList[index]);
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
    );
  }
}
