import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';
import 'package:provider_shopper/screens/cart.dart';
import 'package:provider_shopper/screens/dog.dart';
import 'package:provider_shopper/screens/gym.dart';
import 'package:provider_shopper/screens/milk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/2',
        routes: {
          '/cart': (context) => MyCart(),
          '/1': (context) => Dog(),
          '/3': (context) => Gym(),
          '/2': (context) => Milk(),
        },
      ),
    );
  }
}
