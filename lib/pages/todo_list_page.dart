import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/add_page.dart';
import 'package:flutter_first_project/pages/update_todolist_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todoListItems = [];

  @override
  void initState() {
    getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: todoListCreate(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
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

  Widget todoListCreate() {
    return ListView.builder(
      itemCount: todoListItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              '${todoListItems[index]['title']}',
            ),
            onTap: () {
              // print('xx');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTodolistPage(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> getTodoList() async {
    List alltodo = [];
    var url = Uri.http('192.168.0.54:8000', '/api/all-todolist');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todoListItems = jsonDecode(result);
    });
  }
}
