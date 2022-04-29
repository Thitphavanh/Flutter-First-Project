import 'package:flutter/material.dart';

import '../pages/about_us.dart';
import '../pages/calculate.dart';
import '../pages/cart.dart';
import '../pages/home.dart';
import '../pages/profile.dart';

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
    CartPage(),
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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: 'About Us'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
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
