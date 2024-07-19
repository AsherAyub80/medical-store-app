import 'dart:ui';

class CategoryList {
  final String title;
  final Color color;
  final Color color1;

  CategoryList({
    required this.title,
    required this.color,
    required this.color1,
  });
}

final List<CategoryList> categories = [
  CategoryList(
      title: 'Dental',
      color: const Color(0xffFF9598),
      color1: const Color(0xffFF70A7)),
  CategoryList(
      title: 'Wellness',
      color: const Color(0xff19E5A5),
      color1: const Color(0xff15BD92)),
  CategoryList(
      title: 'Homeo',
      color: const Color(0xffFFC06F),
      color1: const Color(0xffFF793A)),
  CategoryList(
      title: 'Eye Care',
      color: const Color(0xff4DB7FF),
      color1: const Color(0xff3E7DFF))
];
