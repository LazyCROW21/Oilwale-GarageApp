
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_app/models/productcatalog.dart';
import 'package:garage_app/widgets/ItemWidget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {



  @override
  Widget build(BuildContext context) {
     return Container(

         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: ListView.builder(
             itemCount: CatalogModel.products.length,
             itemBuilder: (context, index) {
               return ItemWidget(item: CatalogModel.products[index],);
             }

           ),

    ),

);
  }
}


