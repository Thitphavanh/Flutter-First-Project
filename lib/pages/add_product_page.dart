import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddProductPage extends StatefulWidget {
  // final v1, v2, v3, v4, v5, v6;

  AddProductPage(
      // this.v1,
      // this.v2,
      // this.v3,
      // this.v4,
      // this.v5,
      // this.v6,
      );

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // var _v1, _v2, _v3, _v4, _v5, _v6;
  TextEditingController productName = TextEditingController();
  TextEditingController productDetail = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productQuantity = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _v1 = widget.v1;
    // _v2 = widget.v2;
    // _v3 = widget.v3;
    // _v4 = widget.v4;
    // _v5 = widget.v5;
    // _v6 = widget.v6;

    // productName.text = _v2;
    // productDetail.text = _v3;
    // productPrice = _v4;
    // productSize = _v5;
    // productQuantity = _v6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    buildProductName(),
                    const SizedBox(height: 20),
                    buildProductDetail(),
                    const SizedBox(height: 20),
                    buildProductPrice(),
                    const SizedBox(height: 20),
                    buildProductSize(),
                    const SizedBox(height: 20),
                    buildProductQuantity(),
                    const SizedBox(height: 50),
                    buildAddProductButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildAddProductButton() {
    return TextButton(
      onPressed: () {
        print('-----------');
        print('Name : ${productName.text}');
        print('Detail : ${productDetail.text}');
        print('Price : ${productPrice.text}');
        print('Size : ${productSize.text}');
        print('Quantity : ${productQuantity.text}');
        postProduct();

        setState(() {
          productName.clear();
          productDetail.clear();
          productPrice.clear();
          productSize.clear();
          productQuantity.clear();
        });
      },
      child: Text(
        'Add Product',
        style: TextStyle(
          color: Colors.red.shade300,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextField buildProductQuantity() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: productQuantity,
      decoration: InputDecoration(
        hintText: 'quantity : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 153, 141, 141),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextField buildProductSize() {
    return TextField(
      keyboardType: TextInputType.text,
      controller: productSize,
      decoration: InputDecoration(
        hintText: 'size : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 153, 141, 141),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextField buildProductPrice() {
    return TextField(
      keyboardType: TextInputType.number,
      controller: productPrice,
      decoration: InputDecoration(
        hintText: 'price : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 153, 141, 141),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextField buildProductDetail() {
    return TextField(
      minLines: 4,
      maxLines: 8,
      keyboardType: TextInputType.text,
      controller: productDetail,
      decoration: InputDecoration(
        hintText: 'detail : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextField buildProductName() {
    return TextField(
      keyboardType: TextInputType.name,
      controller: productName,
      decoration: InputDecoration(
        hintText: 'name : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 153, 141, 141),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Future postProduct() async {
    var url = Uri.https('aa39-115-84-94-26.ngrok.io', '/api/post-product');
    // var url = Uri.http('192.168.0.54:8000', '/api/post-product');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"name":"${productName.text}","detail":"${productDetail.text}","price":"${productPrice.text}","size":"${productSize.text}","quantity":"${productQuantity.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print(response.body);
  }
}
