import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_mart/providers/cartprovider.dart';
import 'package:mechanic_mart/screens/garage/product/products.dart';
import 'package:mechanic_mart/screens/garage/account/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'offer/offers.dart';

class GarageScaffold extends StatefulWidget {
  const GarageScaffold({Key? key}) : super(key: key);

  @override
  _GarageScaffoldState createState() => _GarageScaffoldState();
}

class _GarageScaffoldState extends State<GarageScaffold> {
  int _currentindex = 0;
  List<Widget> _children = [];
  PageController _pageController = PageController(initialPage: 0);

  void gotoOffers() {
    setState(() {
      _currentindex = 1;
      _pageController.animateToPage(_currentindex,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    this._children = [
      HomePage(
        gotoOffer: () {
          gotoOffers();
        },
      ),
      OffersPage(),
      ProductsPage(),
      Profile()
    ];
  }

  void onTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final floatingbtn = [
      null,
      null,
      FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      "${context
                          .watch<CartProvider>()
                          .getCartItemCount}",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ))),
            Center(child: Icon(Icons.shopping_cart)),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrange,
      ),
      null
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: _currentindex == 3
        ? [
        PopupMenuButton(
            onSelected: (result) async {
              if (result == 0) {
                Navigator.pushNamed(context, '/garage_history');
              } else if (result == 1) {
                Navigator.pushNamed(context, '/garage_home');
              } else if (result == 2) {
                SharedPreferences sp =
                await SharedPreferences.getInstance();
                sp.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', ModalRoute.withName('/login'));
              }
            },
            offset: const Offset(0.0, 50.0),
            icon: Icon(
              Icons.more_vert,
              color: Colors.deepOrange,
            ),
            color: Colors.grey[300],
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.history_rounded,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text("Purchase History"),
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
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
        ]
            : [],
        title: Text(
          "Mechanic Mart",
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: onTapped,
          children: _children),
      // body: _children[_currentindex],
      floatingActionButton: floatingbtn[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.deepOrangeAccent,
          backgroundColor: Colors.grey[200] ?? Colors.white,

          onTap: (int index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          },
          index: _currentindex,
          items: const <Widget>[
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.local_offer, color: Colors.white),
            Icon(Icons.shopping_bag_outlined, color: Colors.white),
            Icon(Icons.person, color: Colors.white)
          ]),
    );
  }
}
