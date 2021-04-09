import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Занятие спортом',
    'Выгуливание собаки',
    'Покупка молока'
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);
  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Image image;
  Item(this.id, this.name)
      : image = Image.asset(
          'images/' + id.toString() + '.png',
          width: 113,
          height: 98,
        );
  @override
  int get hashCode => id;
  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
