import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<ProductModel> products = [
    ProductModel(
        productName: "product",
        productImage:
            "https://images.pexels.com/photos/16772775/pexels-photo-16772775/free-photo-of-black-and-white-photograph-of-flowers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        isFavourite: true,
        category: "Indoor",
        price: 44.44),
    ProductModel(
        productName: "product",
        productImage:
            "https://images.pexels.com/photos/955086/pexels-photo-955086.jpeg?auto=compress&cs=tinysrgb&w=600",
        isFavourite: false,
        category: "Outdoor",
        price: 8.99),
    ProductModel(
        productName: "third product",
        productImage:
            "https://images.pexels.com/photos/1122629/pexels-photo-1122629.jpeg?auto=compress&cs=tinysrgb&w=600",
        isFavourite: false,
        category: "Aromatic",
        price: 4.55),
    ProductModel(
        productName: "fourth product",
        productImage:
            "https://images.pexels.com/photos/18969973/pexels-photo-18969973/free-photo-of-water-flowing-between-rocks-photographed-in-long-exposure.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        isFavourite: false,
        category: "Succulent",
        price: 9.99),
    ProductModel(
        productName: "fifth product",
        productImage:
            "https://images.pexels.com/photos/19187317/pexels-photo-19187317/free-photo-of-hidden.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        isFavourite: false,
        category: "Indoor",
        price: 4.5),
  ];
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: SizedBox(
                  height: deviceHeight * 0.19,
                  width: deviceWidth * 0.2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: deviceWidth * 0.33,
                        height: deviceHeight * 0.19,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            products[index].productImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].productName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            products[index].category,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Row(children: [
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[300],
                            ),
                            Text("4")
                          ]),
                          Text(
                            "\$" + products[index].price.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        alignment: Alignment.center,
                        height: deviceHeight * 0.04,
                        width: deviceWidth * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Buy",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
