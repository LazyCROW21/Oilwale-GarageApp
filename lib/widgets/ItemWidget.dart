import 'package:flutter/material.dart';
import 'package:garage_app/models/productcatalog.dart';

class ItemWidget extends StatelessWidget {
  final Product item;
  const ItemWidget({Key? key,required this.item}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 15.0,top: 15.0),
      child:Container(
        height: 120.0,width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.0,10.0,10.0,10.0),
              width: 80.0,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.image), fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: 4.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    width: 175.0,
                    child: Text(
                      item.desc,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),


                      Container(
                        child: Text("volume : 4L",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey
                        ),),
                      ),
                  SizedBox(height: 8.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('\u{20B9}${item.price}',
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,
                             color:Colors.deepOrange),
                      ),
                           SizedBox(width: 40.0,),
                           SizedBox(
                             width: 100.0,
                             height: 35.0,
                             child: OutlinedButton(onPressed: () { },
                                 style: OutlinedButton.styleFrom(primary: Colors.deepOrange,backgroundColor: Colors.deepOrange[200]!.withOpacity(.7),
                                     side: BorderSide(color: Colors.deepOrange) ,
                                 ),
                                 child: Text("Add to Cart",style:
                                 TextStyle(color: Colors.deepOrange, fontSize: 12.0),
                                 )
                             ),
                           ),
                         ],
                       )



                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
