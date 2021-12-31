import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:garage_app/models/offer.dart';
import 'package:garage_app/service/offer_api.dart';
import 'package:garage_app/widgets/OffersWidget.dart';
import 'package:garage_app/screens/garage/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.gotoOffer}) : super(key: key);

  final Function gotoOffer;

  @override
  _HomePageState createState() => _HomePageState(this.gotoOffer);
}

class _HomePageState extends State<HomePage> {
  int custNumber = 0;
  String refferalCode = "";
  int credPoints = 0;
  late Offer offers;
  late Function gotoOffer;
  List<Offer> _offList = [];

  @override
  void initState() {
    super.initState();
    OffersAPIManager.getAllActiveScheme().then((resp) {
      setState(() {
        _offList = resp;
        for (int i = 0; i < _offList.length; i++) {
          offers = _offList[i];
          var dateofCreation = offers.startedAt;
          DateTime tempDate =
              new DateFormat("yyyy-MM-dd").parse(dateofCreation);
          if (tempDate.isAfter(dateofOffers)) {
            _offList.removeAt(i);
          }
        }
        custNumber = 500;
        refferalCode = "ADF657";
        credPoints = 786;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  _HomePageState(Function jabadaba) {
    this.gotoOffer = jabadaba;
  }

  bool showoffers = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            height: 100.0,
            color: Colors.white,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(blurRadius: 2.0, color: Colors.grey),
                  ]),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: Text(
                            "Customers",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30.0, 40.0, 5.0, 25.0),
                          child: Text(
                            "$custNumber",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                          child: Text(
                            "Credit Points",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(38.0, 40.0, 5.0, 25.0),
                          child: Center(
                            child: Text(
                              "$credPoints",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
                  child: Divider(
                    height: 1,
                    color: Colors.deepOrange,
                    thickness: 1.0,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Referral Code",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          "$refferalCode",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
              ]))
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Container(
        padding: EdgeInsets.only(left: 25.0, right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Recent Offers ",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            TextButton(
              onPressed: () {
                gotoOffer();
              },
              child: Text(
                "See more offers",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _offList.length,
            itemBuilder: (context, index) {
              return OffersWidget(
                offers: _offList[index],
              );
            }),
      ),
    ]);
  }
}
