import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UpdateTodolistPage extends StatefulWidget {
  final v1, v2, v3;

  const UpdateTodolistPage(
    this.v1,
    this.v2,
    this.v3,
  );

  @override
  State<UpdateTodolistPage> createState() => _UpdateTodolistPageState();
}

class _UpdateTodolistPageState extends State<UpdateTodolistPage> {
  var _v1, _v2, _v3, _v4;
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: todo_title,
                    decoration: InputDecoration(
                      hintText: 'ລາຍການທີ່ຕ້ອງເຮັດ : ',
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
                    controller: todo_detail,
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
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      print('-----------');
                      print('Title : ${todo_title.text}');
                      print('Detail : ${todo_detail.text}');
                      postTodo();

                      setState(() {
                        todo_title.clear();
                        todo_detail.clear();
                      });
                    },
                    child: Text(
                      'ເພີ່ມລາຍການ',
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
    // var url = Uri.https('f678-115-84-96-195.ngrok.io', '/api/post-todolist');
    var url = Uri.http('192.168.0.54:8000', '/api/post-todolist');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title":"${todo_title.text}","detail":"${todo_detail.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print(response.body);
  }
}
