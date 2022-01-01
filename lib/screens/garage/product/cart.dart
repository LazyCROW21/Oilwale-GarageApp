import 'package:flutter/material.dart';
import 'package:garage_app/Providers/CartProvider.dart';
import 'package:garage_app/models/product.dart';
import 'package:garage_app/components/cartwidget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget build(BuildContext context) {
    List<Product> _pList = context.watch<CartProvider>().cartProducts;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: new AppBar(
          leading: BackButton(
            color: Colors.deepOrange,
          ),
          title: Text(
            "Oil Wale",
            style: TextStyle(color: Colors.deepOrange),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                        "Items Purchased:  ${context.watch<CartProvider>().getCartItemCount}"),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: _pList.length,
                    itemBuilder: (context, index) {
                      return CartWidget(
                        item: _pList[index],
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
