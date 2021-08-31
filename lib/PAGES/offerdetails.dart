import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/PAGES/offers.dart';
import 'package:garage_app/utils/routes.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var obj = new OffersPage();

    return Material(
      color: Colors.grey[200],
    child: Container(
           margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,16.0),

           child: Card(
             elevation: 8.0,
             child: Container(
               padding: EdgeInsets.all(10.0),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    Text("Get upto 50% off on these deals .",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),),
                   SizedBox(height: 10.0,),
                   Text("claim a discount of 50% and more on buying newly introduced oils ."),
                   SizedBox(height: 10.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                          TextButton(onPressed: () {/*Navigator.pushNamed(context, MyRoutes.OfferPageRoute);*/},style: TextButton.styleFrom(
                            backgroundColor: Colors.red[100]!.withOpacity(0.5),

                          ),
                              child: Text("Decline",style: TextStyle(color: Colors.red),)
                          ),

                       TextButton(onPressed: () {},style: TextButton.styleFrom(
                         backgroundColor: Colors.green[100]!.withOpacity(0.5),

                       ),child:
                       Text("Accept",style: TextStyle(color: Colors.green),)
                       )
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
