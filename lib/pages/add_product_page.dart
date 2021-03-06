import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/product_list_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productName = TextEditingController();
  TextEditingController productDetail = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productQuantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Add Product'),
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
                    buildProductPrice(),
                    const SizedBox(height: 20),
                    buildProductDetail(),
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
        Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductListPage(),
          ),
        );

        setState(() {
          productName.clear();
          productDetail.clear();
          productPrice.clear();
          productSize.clear();
          productQuantity.clear();
        });
      },
      child: Text(
        '???????????????',
        style: TextStyle(
          color: Colors.red.shade300,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container buildProductQuantity() {
    // return TextField(
    //   keyboardType: TextInputType.number,
    //   controller: productQuantity,
    //   decoration: InputDecoration(
    //     hintText: '??????????????? : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Color.fromARGB(255, 153, 141, 141),
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: productQuantity,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '??????????????? :',
          icon: Icon(Icons.calculate, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Container buildProductSize() {
    //   return Container(
    //     child: Padding(
    //       padding: const EdgeInsets.only(
    //         left: 20.0,
    //       ),
    //       child: TextFormField(
    //         keyboardType: TextInputType.text,
    //         controller: productSize,
    //         decoration: InputDecoration(
    //           hintText: '??????????????? : ',
    //           hintStyle: const TextStyle(color: Colors.red),
    //           border: OutlineInputBorder(
    //             borderSide: const BorderSide(
    //               color: Color.fromARGB(255, 153, 141, 141),
    //             ),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10),
    //             borderSide: const BorderSide(
    //               color: Colors.red,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: productSize,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '??????????????? :',
          icon: Icon(Icons.format_size_sharp, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Container buildProductDetail() {
    // return TextField(
    //   minLines: 4,
    //   maxLines: 8,
    //   keyboardType: TextInputType.text,
    //   controller: productDetail,
    //   decoration: InputDecoration(
    //     hintText: '???????????????????????? : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.red.shade300,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: productDetail,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '???????????????????????? :',
          icon: Icon(Icons.list_alt, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Container buildProductPrice() {
    // return TextField(
    //   keyboardType: TextInputType.number,
    //   controller: productPrice,
    //   decoration: InputDecoration(
    //     hintText: '???????????? : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Color.fromARGB(255, 153, 141, 141),
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: productPrice,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '???????????? :',
          icon: Icon(Icons.price_change, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Container buildProductName() {
    // return TextField(
    //   keyboardType: TextInputType.name,
    //   controller: productName,
    //   decoration: InputDecoration(
    //     hintText: '????????? : ',
    //     hintStyle: const TextStyle(
    //       color: Colors.red,
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Color.fromARGB(255, 153, 141, 141),
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: TextFormField(
        controller: productName,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '??????????????????????????? :',
          icon: Icon(Icons.person, color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 2.0,
            blurRadius: 15.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Future postProduct() async {
    // var url = Uri.https('6d8f-115-84-95-131.ngrok.io', '/api/post-product');
    var url = Uri.http('192.168.0.54:8000', '/api/post-product');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"name":"${productName.text}","detail":"${productDetail.text}","price":"${productPrice.text}","size":"${productSize.text}","quantity":"${productQuantity.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print(response.body);
  }
}
