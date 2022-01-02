import 'package:flutter/material.dart';
import 'package:garage_app/models/product.dart';
import 'package:provider/provider.dart';
import 'package:garage_app/providers/cartprovider.dart';

class ItemWidget extends StatefulWidget {
  final Product product;

  ItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  var btnText = "Add to Cart";
  bool inCart = false;
  Color addToBtnBGColor = Colors.deepOrange[200]!.withOpacity(.3);
  Color addedBtnBGColor = Colors.green.withOpacity(.7);
  Text addToCartText = Text("Add to Cart",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.deepOrange, fontSize: 12.0));
  Text addedToCartText = Text("In Cart",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 12.0));

  @override
  Widget build(BuildContext context) {
    inCart = context.select((CartProvider cartprovider) {
      return cartprovider.checkProductInChart(widget.product);
    });
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/cust_product',
            arguments: widget.product);
      },
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 15.0, top: 15.0),
          child: Container(
            height: 140.0,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  width: 80.0,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/200"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 175.0,
                        child: Text(
                          widget.product.specification,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Grade :" + widget.product.grade,
                          style: TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (context
                                        .read<CartProvider>()
                                        .checkProductInChart(widget.product)) {
                                      inCart = true;
                                      context
                                          .read<CartProvider>()
                                          .removeProduct(widget.product);
                                    } else {
                                      inCart = false;
                                      context
                                          .read<CartProvider>()
                                          .addProduct(widget.product);
                                    }
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: inCart
                                      ? addedBtnBGColor
                                      : addToBtnBGColor,
                                ),
                                child:
                                    inCart ? addedToCartText : addToCartText),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
