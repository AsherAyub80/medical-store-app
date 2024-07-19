import 'package:flutter/material.dart';
import 'package:medical_store_app/Models/product_model.dart';
import 'package:medical_store_app/components/Widgets/product_card.dart';
import 'package:medical_store_app/components/category_list.dart';

import '../components/Widgets/top_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<List<ProductModel>> selectedCategories = [
    dental,
    wellness,
    homeo,
    eyeCare,
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TopCard(height: height, width: width),
          SizedBox(
            height: height * 0.05,
          ),
          categoryItem(),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            width: width * 0.95,
            height: height * 0.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.01),
              image: const DecorationImage(
                  image: AssetImage('images/baner.png'), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deal of the day",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "more",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
              itemCount: selectedCategories[selectedIndex].length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1.5,
                crossAxisCount: 2,
                childAspectRatio: 0.50,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    height: height,
                    productModel: selectedCategories[selectedIndex][index],
                  ),
                );
              })
        ],
      ),
    ));
  }

  SizedBox categoryItem() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Container(
                  padding: EdgeInsets.only(top: height * 0.015),
                  width: width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(height * 0.09)),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.06),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  categories[index].color,
                                  categories[index].color1,
                                ])),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        categories[index].title,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
