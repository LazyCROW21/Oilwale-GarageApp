import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garage_app/models/product.dart';
import 'package:garage_app/service/product_api.dart';
import 'package:garage_app/theme/themedata.dart';
import 'package:garage_app/components/productwidget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProductView(),
    );
  }
}

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<Product> _pList = [];
  SpinKitRing loadingRing = SpinKitRing(
    color: AppColorSwatche.primary,
  );
  bool isSearching = true;
  String searchQry = "";
  DateTime lastInp = DateTime.now();
  bool searchAgain = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    ProductAPIManager.getAllProducts().then((resp) {
      setState(() {
        isSearching = false;
        _pList = resp;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  void buildProductList() {
    String currentStr = searchQry;
    print('At call: ' + searchQry);
    setState(() {
      isSearching = true;
    });
    if (searchQry == "") {
      ProductAPIManager.getAllProducts().then((_result) {
        setState(() {
          _pList = _result;
          isSearching = false;
        });
        if (currentStr != searchQry) {
          buildProductList();
        }
      });
    } else {
      ProductAPIManager.searchProduct(searchQry).then((_result) {
        setState(() {
          _pList = _result;
          isSearching = false;
        });
        if (currentStr != searchQry) {
          buildProductList();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(children: [
        Container(
          height: 50.0,
          child: TextFormField(
            onChanged: (String input) {
              String inpLowercase = input.toLowerCase();
              searchQry = inpLowercase.trim();
              if (isSearching) {
                // searchAgain = true;
                return;
              }
              buildProductList();
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColorSwatche.primary,
                ),
                labelStyle: TextStyle(color: Colors.deepOrange),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide(
                    color: AppColorSwatche.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide(color: AppColorSwatche.primary)),
                hintStyle: textStyle('p1', AppColorSwatche.primary)),
          ),
        ),
        Container(
          child: Expanded(
            child: isSearching
                ? loadingRing
                : RefreshIndicator(
                    onRefresh: () {
                      if (searchQry == "") {
                        return ProductAPIManager.getAllProducts()
                            .then((_result) {
                          setState(() {
                            _pList = _result;
                            isSearching = false;
                          });
                        });
                      } else {
                        return ProductAPIManager.searchProduct(searchQry)
                            .then((_result) {
                          setState(() {
                            _pList = _result;
                            isSearching = false;
                          });
                        });
                      }
                    },
                    child: ListView.builder(
                      itemCount: _pList.length,
                      itemBuilder: (context, index) {
                        return ProductWidget(product: _pList[index]);
                      },
                    ),
                  ),
          ),
        ),
      ]),
    );
  }
}
