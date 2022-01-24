import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mechanic_mart/providers/cartprovider.dart';
import 'package:provider/src/provider.dart';
import '../models/product.dart';

class CartWidget extends StatefulWidget {
  final Product item;

  const CartWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  var count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 15.0, top: 15.0),
        child: Stack(children: [
          Container(
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
                            widget.item.name,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Text(
                          "volume : ${widget.item.packingSize}",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.0,
                            height: 35.0,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        context
                                            .read<CartProvider>()
                                            .decreaseQty(widget.item);
                                        if (count > 1) count--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.deepOrange,
                                    ),
                                  )),
                                  Expanded(
                                    child: Center(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        maxLength: 3,
                                       decoration: InputDecoration(
                                         counter: Offstage(),
                                       ),
                                        controller: TextEditingController(text: '$count'),
                                        keyboardType: TextInputType.number,
                                        onChanged: (String? value) {
                                          setState(() {
                                            count = int.tryParse(value!)?? count;
                                            context.read<CartProvider>().setQty(widget.item,count);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            context
                                                .read<CartProvider>()
                                                .addQty(widget.item);
                                            count++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.deepOrange,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.cancel_outlined),
                color: Colors.black,
                onPressed: () {
                  context.read<CartProvider>().removeProduct(widget.item);
                },
              )),
        ]));
  }
}
