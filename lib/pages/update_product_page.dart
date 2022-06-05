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
    productPrice = _v4;
    productSize = _v5;
    productQuantity = _v6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
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
                  TextField(
                    controller: productName,
                    decoration: InputDecoration(
                      hintText: 'ແກ້ໄຂຂໍ້ມູນ : ',
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
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    minLines: 4,
                    maxLines: 8,
                    controller: productDetail,
                    decoration: InputDecoration(
                      hintText: 'ລາຍລະອຽດ : ',
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
                  ),
                  TextField(
                    controller: productDetail,
                    decoration: InputDecoration(
                      hintText: 'ລາຄາ : ',
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
                  ),
                  TextField(
                    controller: productDetail,
                    decoration: InputDecoration(
                      hintText: 'ຂະໜາດ : ',
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
                  ),
                  TextField(
                    controller: productDetail,
                    decoration: InputDecoration(
                      hintText: 'ຈຳນວນ : ',
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
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      print('-----------');
                      print('Title : ${productName.text}');
                      print('Detail : ${productDetail.text}');
                      postTodo();

                      setState(() {
                        productName.clear();
                        productDetail.clear();
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

  Future postTodo() async {
    var url = Uri.https('1b0d-115-84-94-106.ngrok.io', '/api/post-product');
    // var url = Uri.http('192.168.0.54:8000', '/api/post-product');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"name":"${productName.text}","detail":"${productDetail.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print(response.body);
  }
}
