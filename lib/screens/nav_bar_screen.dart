import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_store_app/screens/cart_screen.dart';
import 'package:medical_store_app/screens/home_screen.dart';
import 'package:medical_store_app/screens/profile.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  List screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    CartScreen(),
    Profile()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Color(0xff4157FF),
        child: const FaIcon(
          FontAwesomeIcons.squarePlus,
          size: 35,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: currentIndex == 0
                      ? Color(0xff4157FF)
                      : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.bell,
                  size: 30,
                  color: currentIndex == 1
                      ? Color(0xff4157FF)
                      : Colors.grey.shade400,
                )),
            const SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: currentIndex == 3
                      ? Color(0xff4157FF)
                      : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: currentIndex == 4
                      ? Color(0xff4157FF)
                      : Colors.grey.shade400,
                )),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
