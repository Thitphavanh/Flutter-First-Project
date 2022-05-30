import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/add_product_page.dart';
import 'package:flutter_first_project/pages/update_product_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List productListItems = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productListCreate(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AddProductPage(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Widget productListCreate() {
    return ListView.builder(
      itemCount: productListItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              '${productListItems[index]['title']}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProductPage(
                    productListItems[index]['id'],
                    productListItems[index]['name'],
                    productListItems[index]['detail'],
                    productListItems[index]['price'],
                    productListItems[index]['size'],
                    productListItems[index]['quantity'],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> getProductList() async {
    List alltodo = [];
    var url = Uri.http('192.168.0.54:8000', '/api/all-product');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      productListItems = jsonDecode(result);
    });
  }
}
