import 'package:flutter/material.dart';
import 'package:garage_app/PAGES/offerdetails.dart';
import 'package:garage_app/utils/routes.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  OffersPageState createState() => OffersPageState();
}

class OffersPageState extends State<OffersPage> {
  bool showoffer = false;
  Widget build(BuildContext context) {
    return showoffer ? OfferDetails() :  Material (
      child: Column(
        children: [
          Card(
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.all(15.0),
                    child: Icon(Icons.local_offer_rounded,color: Colors.deepOrange,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Text("50% off on Oils 2021",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text("claim a discount of 50% and more on buying newly introduced oils .",
                          style: TextStyle(
                              fontSize: 10.0
                          ),)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.all(15.0),
                    child: Icon(Icons.local_offer_rounded, color: Colors.deepOrange,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Text("50% off on Oils 2021",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text("claim a discount of 50% and more on buying newly introduced oils .",
                          style: TextStyle(
                              fontSize: 10.0
                          ),)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.all(15.0),
                    child: Icon(Icons.local_offer_rounded,color: Colors.deepOrange,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Text("50% off on Oils 2021",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text("claim a discount of 50% and more on buying newly introduced oils .",
                          style: TextStyle(
                              fontSize: 10.0
                          ),)
                      ]
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.all(15.0),
                    child: Icon(Icons.local_offer_rounded,color: Colors.deepOrange,),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Text("50% off on Oils 2021",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text("claim a discount of 50% and more on buying newly introduced oils .",
                          style: TextStyle(
                              fontSize: 10.0
                          ),)
                      ]
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showoffer = true;
              });
            },
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(15.0),
                      child: Icon(Icons.local_offer_rounded,color: Colors.deepOrange,),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children :[
                          Text("50% off on Oils 2021",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("claim a discount of 50% and more on buying newly introduced oils .",
                            style: TextStyle(
                                fontSize: 10.0
                            ),)
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
