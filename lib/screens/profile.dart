import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          top: height * 0.08,
          right: width * 0.05,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                      fontSize: height * 0.03, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: height * 0.05,
                  backgroundImage: AssetImage('images/boy.png'),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Hi, Asher Ayub',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.03),
                    ),
                    Text(
                      'Welcome to Quick Medical Store',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.015),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Profilewidget(
              height: height,
              width: width,
              image: 'images/myprofile.png',
              title: 'Edit Profile',
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Profilewidget(
                height: height,
                width: width,
                title: 'My Orders',
                image: 'images/orders.png'),
            SizedBox(
              height: height * 0.04,
            ),
            Profilewidget(
                height: height,
                width: width,
                title: 'Billing',
                image: 'images/clock.png'),
            SizedBox(
              height: height * 0.04,
            ),
            Profilewidget(
                height: height,
                width: width,
                title: 'Faq',
                image: 'images/faq.png'),
          ],
        ),
      ),
    );
  }
}

class Profilewidget extends StatelessWidget {
  const Profilewidget({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.image,
  });

  final double height;
  final double width;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.08,
                  child: Image.asset(
                    fit: BoxFit.fill,
                    image,
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: height * 0.03),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: height * 0.03,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.12),
          child: Divider(),
        ),
      ],
    );
  }
}
