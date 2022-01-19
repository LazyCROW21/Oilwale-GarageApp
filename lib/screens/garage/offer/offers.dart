import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garage_app/models/offer.dart';
import 'package:garage_app/service/offer_api.dart';
import 'package:garage_app/theme/themedata.dart';
import 'package:garage_app/components/offerwidget.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  OffersPageState createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {
  bool offersEmpty = false;
  bool showOffer = false;
  late Offer offers;
  List<Offer> _offList = [];
  SpinKitRing loadingRing = SpinKitRing(
    color: AppColorSwatche.primary,
  );
  bool isLoading = true;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    OffersAPIManager.getAllActiveScheme().then((resp) {
      setState(() {
        isLoading = false;
        _offList = resp;
        if (_offList.isEmpty) {
          offersEmpty = true;
        }
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Widget build(BuildContext context) {
    return isLoading
        ? loadingRing
        : offersEmpty
            ? Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "No Offers at the moment ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _offList.length,
                    itemBuilder: (context, index) {
                      return OffersWidget(
                        offers: _offList[index],
                      );
                    }),
              );
  }
}
