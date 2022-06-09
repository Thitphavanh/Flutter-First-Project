import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UpdatProductPage extends StatefulWidget {
  final v1, v2, v3, v4, v5, v6;

  const UpdatProductPage(
    this.v1,
    this.v2,
    this.v3,
    this.v4,
    this.v5,
    this.v6,
  );

  @override
  State<UpdatProductPage> createState() => _UpdatProductPageState();
}

class _UpdatProductPageState extends State<UpdatProductPage> {
  var _v1, _v2, _v3, _v4, _v5, _v6;
  TextEditingController productName = TextEditingController();
  TextEditingController productDetail = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productQuantity = TextEditingController();

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
    _v5 = widget.v5;
    _v6 = widget.v6;

    productName.text = _v2;
    productDetail.text = _v3;
    productPrice.text = _v4;
    productSize.text = _v5.toString();
    productQuantity.text = _v6.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Update Product'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  editProductName(),
                  const SizedBox(height: 20),
                  editProductDetail(),
                  const SizedBox(height: 20),
                  editProductPrice(),
                  const SizedBox(height: 20),
                  editProductSize(),
                  const SizedBox(height: 20),
                  editProductQuantity(),
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      print('-----------');
                      print('Title : ${productName.text}');
                      print('Detail : ${productDetail.text}');
                      print('Price : ${productPrice.text}');
                      print('Size : ${productSize.text}');
                      print('Quantity : ${productQuantity.text}');
                      updateProduct();

                      setState(() {
                
                      });
                    },
                    child: Text(
                      'ແກ້ໄຂ',
                      style: TextStyle(
                        color: Colors.red.shade300,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container editProductQuantity() {
    // return TextField(
    //   controller: productQuantity,
    //   decoration: InputDecoration(
    //     hintText: 'ແກ້ໄຂຈຳນວນ : ',
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
        controller: productQuantity,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'ແກ້ໄຂຈຳນວນ :',
          icon: Icon(Icons.calculate),
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

  Container editProductSize() {
    // return TextField(
    //   controller: productSize,
    //   decoration: InputDecoration(
    //     hintText: 'ແກ້ໄຂຂະໜາດ : ',
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
        controller: productSize,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'ແກ້ໄຂຂະໜາດ :',
          icon: Icon(Icons.format_size_sharp),
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

  Container editProductPrice() {
    // return TextField(
    //   controller: productPrice,
    //   decoration: InputDecoration(
    //     hintText: 'ແກ້ໄຂລາຄາ : ',
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
          hintText: 'ແກ້ໄຂລາຍລະອຽດ :',
          icon: Icon(Icons.list_alt),
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

  Container editProductDetail() {
    // return TextField(
    //   minLines: 4,
    //   maxLines: 8,
    //   controller: productDetail,
    //   decoration: InputDecoration(
    //     hintText: 'ແກ້ໄຂລາຍລະອຽດ : ',
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
        controller: productPrice,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'ແກ້ໄຂລາຄາ :',
          icon: Icon(Icons.price_change),
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

  Container editProductName() {
    // return TextField(
    //   controller: productName,
    //   decoration: InputDecoration(
    //     hintText: 'ແກ້ໄຂຊື່ : ',
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
          hintText: 'ແກ້ໄຂຊື່ສິນຄ້າ :',
          icon: Icon(Icons.person),
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

  Future updateProduct() async {
    // var url = Uri.https('6d8f-115-84-95-131.ngrok.io', '/api/update-product/$_v1');
    var url = Uri.http('192.168.0.54:8000', '/api/update-product/$_v1');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"name":"${productName.text}","detail":"${productDetail.text}","price":"${productPrice.text}","size":"${productSize.text}","quantity":"${productQuantity.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('-------Result-------');
    print(response.body);
  }
}
