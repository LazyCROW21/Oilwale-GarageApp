import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        actions: [
          PopupMenuButton(
              offset: const Offset(0.0, 50.0),
              icon: Icon(Icons.more_vert, color: Colors.deepOrange,),
              color: Colors.grey[300],

              itemBuilder: (context) =>
              [

                PopupMenuItem(child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.deepOrange,),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("Settings"),
                  ],
                )),
                PopupMenuItem(child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("Logout")
                  ],
                ))
              ])
        ],
        title: Text(
          "Oil Wale",
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [
            _tile("Oil 4t GT ", 1200, 1,)
          ],
        ),

      ),

    );
  }

  ListTile _tile(String title, int price, int count) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),

    );
  }
}
