// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_store_app/provider/cart_provider.dart';
import 'package:medical_store_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class TopCard extends StatelessWidget {
  TopCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: true);
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(height * 0.03),
                    bottomRight: Radius.circular(height * 0.03),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff4157FF),
                      Color(0xff3D50E7),
                    ],
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    top: height * 0.07,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: height * 0.04,
                          backgroundImage: const AssetImage('images/boy.png'),
                        ),
                        Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.bell,
                                  color: Colors.white,
                                ),
                                Positioned(
                                  right: -2,
                                  top: -1,
                                  child: Container(
                                    height: height * 0.023,
                                    width: width * 0.023,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: height * 0.03,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  },
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  right: -2,
                                  top: -5,
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        provider.cart.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.015),
                                      ),
                                    ),
                                    height: height * 0.035,
                                    width: width * 0.035,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Hi, Asher',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: height * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Welcome to Quick Medical Store',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: height * -0.04,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.2),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                          blurStyle: BlurStyle.solid)
                    ]),
                width: width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Search Medicine & Healthcare products',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(height * 0.2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(height * 0.2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(height * 0.2)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.08, right: width * 0.4),
          child: Text(
            'Top Categories',
            style:
                TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
