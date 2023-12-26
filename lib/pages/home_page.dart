import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/widgets/home_categorty.dart';
import 'package:my_app/widgets/home_filter.dart';
import 'package:my_app/widgets/home_plant.dart';
import 'package:my_app/widgets/home_popular.dart';
import 'package:my_app/widgets/home_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "All"},
    {"id": 2, "name": "Indoor"},
    {"id": 3, "name": "Outdoor"},
    {"id": 4, "name": "Aromatic"},
    {"id": 5, "name": "Succulent"},
  ];

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

  Map<String, dynamic> selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            homeTitle(context),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            home_filter(context),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            homeCategory(
                context: context,
                deviceHeight: deviceHeight,
                categories: categories,
                selectedCategory: selectedCategory,
                onClick: (Map<String, dynamic> category) {
                  setState(() {
                    selectedCategory = category;
                  });
                }),
            SizedBox(
              height: deviceHeight * 0.033,
            ),
            homePlant(
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                products: products,
                isFavouriteChanged: (int index) {
                  setState(() {
                    products[index].isFavourite = !products[index].isFavourite;
                  });
                },
                currentCategory: selectedCategory["name"]),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            homePopular(
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                products: products),
          ],
        ),
      ),
    );
  }
}
