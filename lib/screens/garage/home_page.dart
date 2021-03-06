import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mechanic_mart/models/garage.dart';
import 'package:mechanic_mart/models/offer.dart';
import 'package:mechanic_mart/service/offer_api.dart';
import 'package:mechanic_mart/theme/themedata.dart';
import 'package:mechanic_mart/components/offerwidget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.gotoOffer}) : super(key: key);

  final Function gotoOffer;

  @override
  _HomePageState createState() => _HomePageState(this.gotoOffer);
}

class _HomePageState extends State<HomePage> {
  int customerNumber = 0;
  String referralCode = "";
  int credPoints = 0;
  late Offer offers;
  late Function gotoOffer;
  List<Offer> _offList = [];

  Garage garage = Garage(
      referralCode: '',
      pincode: 'loading ..',
      garageId: 'loading ..',
      phoneNumber: 'loading ..',
      area: 'loading ..',
      totalCustomer: 0,
      address: 'loading ..',
      ownerName: 'loading ..',
      totalScore: 0,
      garageName: 'loading ..',
      isPremium: false);

  bool isLoading = true;
  bool offersEmpty = false;

  SpinKitRing loadingRing = SpinKitRing(
    color: AppColorSwatche.primary,
  );

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _changed() {
    offersEmpty = true;
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((garagePreferences) {
      setState(() {
        garage.totalCustomer = garagePreferences.getInt("totalCustomer") ?? 0;
        garage.totalScore = garagePreferences.getInt("totalScore") ?? 0;
        garage.referralCode =
            garagePreferences.getString("referralCode") ?? "Not found";
      });
    });

    OffersAPIManager.getAllActiveScheme().then((resp) {
      setState(() {
        _offList = resp;
        for (int i = 0; i < _offList.length; i++) {
          offers = _offList[i];
          var dateofCreation = offers.startedAt;
          DateTime tempDate =
              new DateFormat("yyyy-MM-dd").parse(dateofCreation);
          if (tempDate.isAfter(DateTime.now())) {
            _offList.removeAt(i);
          }
        }
        if (_offList.isEmpty) {
          _changed();
        }
        customerNumber = 500;
        referralCode = "ADF657";
        credPoints = 786;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  _HomePageState(Function gotoOffer) {
    this.gotoOffer = gotoOffer;
  }

  bool showOffers = false;

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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () { Navigator.pushNamed(context, '/customer_list'); },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Customers",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Text(
                              "${garage.totalCustomer}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Credit Points",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                          Center(
                            child: Text(
                              "${garage.totalScore}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
                  child: Divider(
                    height: 1,
                    color: Colors.deepOrange,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      "${garage.referralCode}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
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
      offersEmpty
          ? Center(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "No Recent Offers at the moment ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(),
      Expanded(
        child: isLoading
            ? loadingRing
            : ListView.builder(
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
