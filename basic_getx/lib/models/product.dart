import 'package:flutter/material.dart';

class Product {
  final Color color;
  final String name;
  Product({
    required this.color,
    required this.name,
  });

  static List<Product> items = List.generate(
    12,
    (index) => Product(color: Colors.primaries[index], name: "Product $index"),
  );
}
