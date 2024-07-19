import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_store_app/Models/product_model.dart';
import 'package:medical_store_app/components/Widgets/image_slider.dart';
import 'package:medical_store_app/components/my_button.dart';
import 'package:medical_store_app/provider/cart_provider.dart';
import 'package:medical_store_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentIndex = 0;
  int image = 3;
  @override
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.bell,
                              color: Colors.black,
                            ),
                            Positioned(
                              right: -2,
                              top: -1,
                              child: Container(
                                height: height * 0.023,
                                width: width * 0.023,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
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
                                        builder: (context) => CartScreen()));
                              },
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.black,
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
                                    shape: BoxShape.circle, color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                widget.productModel.title,
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.productModel.subtitle,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ImageSlide(
                onChanged: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                image: widget.productModel.image,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    image,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentImage % image == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rs.${widget.productModel.orignalprice}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Rs.${widget.productModel.discountprice}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        widget.productModel.pricetitle,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  AddToCartBtn(
                    height: height,
                    width: width,
                    productModel: widget.productModel,
                    selectedIndex: currentIndex,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Text(
                'Package Size',
                style: TextStyle(
                    fontSize: height * 0.03, fontWeight: FontWeight.bold),
              ),
              Row(
                children: List.generate(widget.productModel.pricelist.length,
                    (index) {
                  final priceModel = widget.productModel.pricelist[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Rs${priceModel.price}',
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: currentIndex == index
                                        ? Color(0xffFFA41B)
                                        : Colors.black),
                              ),
                              Text('${priceModel.tablet} pallets',
                                  style: TextStyle(
                                      fontSize: height * 0.020,
                                      color: currentIndex == index
                                          ? Color(0xffFFA41B)
                                          : Colors.black))
                            ],
                          ),
                        ),
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.orange.shade50
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: currentIndex == index
                                    ? Color(0xffFFA41B)
                                    : Colors.transparent)),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.03),
                    ),
                    Text(
                      widget.productModel.desc,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'Ingredients',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.03),
                    ),
                    Text(
                      widget.productModel.ingred,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Expiry Date',
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.productModel.expiry,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          width: width * 0.25,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Brand Name',
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.productModel.brandname,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(
                          width: width * 0.28,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.04, bottom: height * 0.05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              widget.productModel.rating
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 30,
                                              color: Color(0xffFFC000),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Text(
                                          '${widget.productModel.ratingnum.toString()} Ratings',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          'and ${widget.productModel.reviews.toString()} Reviews',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.2,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.52,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      widget.productModel.ratingper.length,
                                      (index) {
                                        double ratingPercentage = widget
                                                .productModel.ratingper[index] /
                                            100;

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.productModel
                                                        .ratings[index]
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.star,
                                                  color: Color(0xffFFD040)),
                                              SizedBox(
                                                width: width * 0.28,
                                                child: Container(
                                                  height: height * 0.01,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: FractionallySizedBox(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    widthFactor:
                                                        ratingPercentage,
                                                    child: Container(
                                                      height: height * 0.01,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff4157FF),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5), // Rounded corners
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.005,
                                              ),
                                              Text(
                                                "${widget.productModel.ratingper[index]}%",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children:
                    List.generate(widget.productModel.userrew.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xffFFD040)),
                          Text(widget.productModel.userrew[index]['userrating']
                              .toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.productModel.userrew[index]['name'],
                                style: TextStyle(fontSize: height * 0.025),
                              ),
                            ],
                          ),
                          Text(
                            widget.productModel.userrew[index]['time'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        widget.productModel.userrew[index]['comment'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              MyButton(
                  height: height * 0.08,
                  width: width * 0.9,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  text: "Go to cart"),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({
    Key? key,
    required this.productModel,
    required this.height,
    required this.width,
    required this.selectedIndex,
  }) : super(key: key);

  final ProductModel productModel;
  final double height;
  final double width;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        return SizedBox(
          height: height * 0.1,
          width: width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.addToCart(productModel, selectedIndex);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to Cart')),
                  );
                },
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Color(0xff006AFF),
                    ),
                  ),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff006AFF), width: 2),
                  ),
                ),
              ),
              Text(
                'Add to cart',
                style: TextStyle(color: Color(0xff006AFF), fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }
}
