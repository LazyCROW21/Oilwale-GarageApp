import 'package:flutter/material.dart';
import 'package:mechanic_mart/models/product.dart';
import 'package:mechanic_mart/theme/themedata.dart';

class ShowProductsTile extends StatelessWidget {
  final Product product;

  const ShowProductsTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.black,
      child: Hero(
        tag: ValueKey(product.id),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pushNamed(context, "/cust_product", arguments: product);
          },
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 4.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://picsum.photos/200',
                          height: 60,
                          width: 60,
                        )),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 15.0)),
                            SizedBox(
                              height: 2.0,
                            ),
                            Row(
                              children: [
                                Text('Grade: ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13.0)),
                                Text(product.grade,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppColorSwatche.primary)),
                              ],
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(product.specification,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColorSwatche.grey,
                                    fontSize: 13.0)),
                          ],
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
