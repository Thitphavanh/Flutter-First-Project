import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

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
                  const SizedBox(height: 20),
                  TextField(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
