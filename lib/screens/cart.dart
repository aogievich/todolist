import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

const mColor = Color(0xFF997B7B);

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выполненные задачи:'),
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        color: Color(0xFFFFFFF),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    Padding(padding: EdgeInsets.all(20));
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Container(child: cart.items[index].image),
        trailing: IconButton(
          icon: Icon(Icons.read_more, size: 28),
          onPressed: () => Navigator.pushNamed(
              context, '/' + cart.items[index].id.toString()),
        ),
        title: Text(cart.items[index].name),
      ),
    );
  }
}
