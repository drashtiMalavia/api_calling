import 'dart:convert';

import 'package:api_calling/ProductModel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Displayproduct extends StatefulWidget {
  const Displayproduct({super.key});

  @override
  State<Displayproduct> createState() => _DisplayproductState();
}

class _DisplayproductState extends State<Displayproduct> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
          ),
          backgroundColor: Colors.brown.shade400,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: FutureBuilder<ProductModel>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context, index) {
                          var product = snapshot.data!.products![index];
                          return Padding(
                            padding: EdgeInsets.all(4),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: Colors.brown.shade100,
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.brown,
                                          radius: 25,
                                          child: Text("${product.id}",style: TextStyle(fontSize: 25),)
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 40,right: 35),
                                          child: Text("${product.discountPercentage}%",style: TextStyle(fontSize: 20),))
                                    ],
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(top: 18),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 3,color: Colors.brown.shade600),
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Image.network(
                                          "${product.thumbnail}")),
                                  SizedBox(height: 10),
                                  Text(
                                    "${product.title}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "${product.description}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.brown.shade600),
                                        ),
                                        child: Text("Price: ${product.price}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.brown.shade600)),
                                        child: Text("★ ${product.rating} ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Text("Stock: ${product.stock} Left",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "Warranty: ${product.warrantyInformation}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Text("No data found."));
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              getData(); // load data
            });
          },
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          backgroundColor: Colors.brown.shade400,
        ),
      ),
    );
  }

  Future<ProductModel> getData() async {
    var baseurl=await Uri.parse('https://dummyjson.com/products');
    var response=await http.get(baseurl);
    print('Responce=${response.body}');
    var myProduct=jsonDecode(response.body);
    ProductModel model=ProductModel.fromJson(myProduct);
    print('mypost=${model.products![2].description}');
    return model;
  }
}
