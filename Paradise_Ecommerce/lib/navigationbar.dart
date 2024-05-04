import 'package:e_commerce/categorylist.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var PrimaryColor = Color.fromARGB(255, 129, 141, 248);
  int current = 0;

  Widget bodyPage(int index) {
    if (index == 0) {
      return HomePage();
    } else if (index == 1) {
      return CategoryList();
    } else {
      return Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPage(current),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        backgroundColor: PrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: current,
        onTap: (int index) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}
