import 'package:flutter/material.dart';
import 'package:garage_app/providers/cartprovider.dart';
import 'package:garage_app/models/product.dart';
import 'package:garage_app/components/cartwidget.dart';
import 'package:garage_app/service/order_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartProducts = [];
  Widget build(BuildContext context) {

      cartProducts = context.read<CartProvider>().cartProducts;
    Map<String,int> map12 ={};
      setState(() {
        map12 = Map.fromIterable(cartProducts, key: (product) => product.id, value: (product) => product!.qty);
      });

    late String garageId;

    SharedPreferences.getInstance().then((garagePreference) {
      garageId = garagePreference.getString("garageId") ?? "Not found";
    });

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
                        "Items in Cart : ${context.watch<CartProvider>().getCartItemCount}"),
                  ],
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Expanded(
                  flex: 10,
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
            Expanded(
              flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
              onPressed: () async{
                await OrderAPIManager.postOrderAccept(garageId, map12);
                context.read<CartProvider>().clearCartProductList();
              },
              child: Text("Place Order"),
            ),
                ))
          ],
        ));
  }
}
