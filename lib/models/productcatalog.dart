class CatalogModel{
  static final List<Product> products = [
    Product(
        id:"#1234",
        name:"Core Oil 4t",
        desc: "Road fate par nawaabi na ghatte" ,
        price:1200,
        image: "https://5.imimg.com/data5/XU/JS/MY-32043376/castrol-brake-oil-500x500.jpg"
    ),
    Product(
        id:"#1234",
        name:"Core Oil 4t",
        desc: "Road fate par nawaabi na ghatte" ,
        price:1200,
        image: "https://5.imimg.com/data5/XU/JS/MY-32043376/castrol-brake-oil-500x500.jpg"
    ),
    Product(
        id:"#1234",
        name:"Core Oil 4t",
        desc: "Road fate par nawaabi na ghatte" ,
        price:1200,
        image: "https://5.imimg.com/data5/XU/JS/MY-32043376/castrol-brake-oil-500x500.jpg"
    ),
    Product(
        id:"#1234",
        name:"Core Oil 4t",
        desc: "Road fate par nawaabi na ghatte" ,
        price:1200,
        image: "https://5.imimg.com/data5/XU/JS/MY-32043376/castrol-brake-oil-500x500.jpg"
    ),
    Product(
        id:"#1234",
        name:"Core Oil 4t",
        desc: "Road fate par nawaabi na ghatte" ,
        price:1200,
        image: "https://5.imimg.com/data5/XU/JS/MY-32043376/castrol-brake-oil-500x500.jpg"
    )
  ];
}

class Product{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Product({required this.id,required this.name,  required this.desc, required this.price, required this.image});

}

