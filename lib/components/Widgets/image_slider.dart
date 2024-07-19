import 'package:flutter/material.dart';

class ImageSlide extends StatelessWidget {
  final Function(int) onChanged;
  final String image;
  const ImageSlide({super.key, required this.onChanged, required this.image});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.3,
      width: width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
      child: PageView.builder(
          onPageChanged: onChanged,
          itemBuilder: (context, index) {
            return Image.asset(
              image,
              fit: BoxFit.fitHeight,
            );
          }),
    );
  }
}
