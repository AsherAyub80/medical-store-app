import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_store_app/components/my_button.dart';
import 'package:medical_store_app/provider/cart_provider.dart';
import 'package:medical_store_app/screens/nav_bar_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        child: IconButton(
          icon: FaIcon(FontAwesomeIcons.moneyBill1),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomBottomSheet();
                });
          },
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavBarScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Your Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.01, left: width * 0.05, right: width * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cartProvider.cart.length.toString()} items in your cart',
                    style:
                        TextStyle(color: Colors.grey, fontSize: height * 0.025),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavBarScreen()));
                    },
                    child: Container(
                      child: Row(children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: height * 0.04,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          'Add more',
                          style: TextStyle(
                              color: Colors.blue, fontSize: height * 0.025),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      var product = value.cart[index];
                      var priceModel =
                          product.pricelist[product.selectedVariantIndex];

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: height * 0.2,
                                width: width * 0.9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.99,
                                      width: width * 0.28,
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  product.title.length > 10
                                                      ? 13
                                                      : 17),
                                        ),
                                        Text(
                                          "Pack of ${priceModel.tablet.toString()} pallets",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rs.${priceModel.price.toString()}',
                                              style: TextStyle(
                                                  fontSize: height * 0.03,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: height * 0.06,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Color(0xffF2F4FF)),
                                                  child: Center(
                                                    child: Text(
                                                      product.quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize:
                                                              height * 0.028,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    value.decrementQty(index);
                                                  },
                                                  child: Container(
                                                    height: height * 0.06,
                                                    width: width * 0.1,
                                                    child: Center(
                                                      child: FaIcon(
                                                        FontAwesomeIcons.minus,
                                                        color:
                                                            Color(0xff4157FF),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffDFE3FF),
                                                        shape: BoxShape.circle),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      value.incrementQty(index);
                                                    },
                                                    child: Container(
                                                      height: height * 0.06,
                                                      width: width * 0.1,
                                                      child: Center(
                                                        child: FaIcon(
                                                          FontAwesomeIcons.plus,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffA0ABFF),
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Positioned(
                                right: -6,
                                top: -20,
                                child: GestureDetector(
                                  onTap: () {
                                    value.deleteItem(index);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: width * 0.09,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.xmark,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey.shade400,
                                            width: 2)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.5,
      padding: EdgeInsets.only(
          top: height * 0.02, left: width * 0.04, right: width * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Summary',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * 0.03),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.xmark,
                    color: Colors.grey,
                  ))
            ],
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '${provider.totalPrice().toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      'Free',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '${provider.totalPrice().toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          MyButton(
              height: height * 0.09,
              width: width * 0.04,
              onTap: () {},
              text: 'Check out')
        ],
      ),
    );
  }
}
