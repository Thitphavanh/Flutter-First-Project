import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/add_product_page.dart';
import 'package:flutter_first_project/pages/profile_page.dart';
import 'package:flutter_first_project/pages/product_list_page.dart';
import '../pages/about_us_page.dart';
import '../pages/calculate_page.dart';
import '../pages/home_page.dart';

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
    ProductList(),
    AboutUsPage(),
    ProfilePage(),
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
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Calculate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
