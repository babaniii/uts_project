import 'package:flutter/material.dart';

class Item {
  final String name;
  final int price;
  final TextEditingController quantity;

  Item({
    required this.name,
    required this.price,
  }) : quantity = TextEditingController(text: '0');
}

final List<Item> items = [
  Item(name: "Laptop", price: 25000000),
  Item(name: "Mouse", price: 1250000),
  Item(name: "Keyboard", price: 1500000),
  Item(name: "Monitor", price: 5000000),
  Item(name: "Printer", price: 2200000),
];
