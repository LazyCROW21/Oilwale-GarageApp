import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garage_app/models/offer.dart';
import 'package:garage_app/components/showproductstile.dart';
import 'package:garage_app/service/offer_api.dart';
import 'package:garage_app/theme/themedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {

  SpinKitRing loadingRing = SpinKitRing(
    size: 20.0,
    color: AppColorSwatche.primaryGreen,
  );
  bool isloading = true;
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  late String garageId ;

  bool isOfferAccepted = false;

  var message = "Accept";

  late Offer offers ;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";
      OffersAPIManager.isOfferAccepted(garageId, offers.schemeId).then((resp) {
        setState(() {
          isOfferAccepted = resp;
          isloading = false;
          if(isOfferAccepted)
            message = " Accepted ";
        });
      }).onError((error, stackTrace) {
        print(error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

     offers = ModalRoute.of(context)!.settings.arguments as Offer;

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
                      onPressed: () async {
                        if(!isOfferAccepted) {
                          await OffersAPIManager.offerAccept(
                              true, garageId, offers.schemeId);
                          Navigator.pop(context, '/garage_offers');
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green[100]!.withOpacity(0.5),
                      ),
                      child: isloading ? loadingRing :Text(
                        message,
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
