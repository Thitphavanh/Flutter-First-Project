import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/add.dart';
import 'package:flutter_first_project/pages/todo_list.dart';
import '../pages/about_us.dart';
import '../pages/calculate.dart';
import '../pages/home.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    CalculatePage(),
    AboutUsPage(),
    AddPage(),
    TodoList(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phenomenal'),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.grey.shade400),
          unselectedIconTheme: IconThemeData(color: Colors.red.shade300),
          selectedItemColor: Colors.grey.shade400,
          unselectedItemColor: Colors.red.shade300,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task), label: 'TodoList'),
          ],
          onTap: (index) {
            setState(
              () {
                print(index);
                _currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
