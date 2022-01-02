import 'package:flutter/material.dart';
import 'package:garage_app/providers/cartprovider.dart';
import 'package:garage_app/models/product.dart';
import 'package:garage_app/components/cartwidget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartProducts = [];
  @override
  void initState() {
    super.initState();
    cartProducts = context.read<CartProvider>().cartProducts;
  }

  Widget build(BuildContext context) {
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
                        "Items Purchased: ${context.watch<CartProvider>().getCartItemCount}"),
                  ],
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: cartProducts.length, //_pList.length,
                      itemBuilder: (context, index) {
                        // return Container();
                        return CartWidget(
                          item: cartProducts[index],
                        );
                      }),
                );
              },
            ),
          ],
        ));
  }
}
