import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';

Widget homePlant(
    {required double deviceHeight,
    required double deviceWidth,
    required List<ProductModel> products,
    required Function isFavouriteChanged,
    required String currentCategory}) {
  return SizedBox(
    height: deviceHeight * 0.37,
    child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return currentCategory == "All" ||
                  currentCategory == products[index].category
              ? Card(
                  color: Colors.white,
                  elevation: 3.0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.only(left: 5),
                    width: deviceWidth * 0.4,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // color: Colors.red,
                              child: SizedBox(
                                height: deviceHeight * 0.18,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    products[index].productImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: InkWell(
                                onTap: () {
                                  isFavouriteChanged(index);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: products[index].isFavourite
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      products[index].category,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            158, 158, 158, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(products[index].productName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          // color: Colors.grey[500],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text("Price",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text(
                                        "\$" + products[index].price.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          // color: Colors.,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              : Text("");
        }),
  );
}
