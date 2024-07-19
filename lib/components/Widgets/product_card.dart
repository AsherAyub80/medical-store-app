import 'package:flutter/material.dart';
import 'package:medical_store_app/Models/product_model.dart';
import 'package:medical_store_app/screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.height,
    required this.productModel,
  });
  final ProductModel productModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      productModel: productModel,
                    )));
      },
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height * 0.01),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                      image: AssetImage(productModel.image), fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.title),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rs.${productModel.orignalprice}',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Rs.${productModel.discountprice}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 0,
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.010,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: height * 0.01, left: width * 0.009),
                  child: Text(
                    productModel.rating.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            height: 35,
            width: 80,
            decoration: BoxDecoration(
                color: Color(0xffFFC000),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(height * 0.03),
                    bottomLeft: Radius.circular(height * 0.03))),
          ),
        ),
      ]),
    );
  }
}
