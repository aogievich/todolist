import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';

void main() => runApp(Dog());
const gColor = Color(0xFFF5BA11);
const wColor = Color(0xFFFFFFFF);
const blColor = Color(0xFF000000);
const bColor = Color(0xFFAFAFAF);
const grColor = Color(0xffE7E7E7);
const prColor = Color(0xFF5A59A5);
final Item item = item;

class Dog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 125, bottom: 25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Задача:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Нужно погулять с собакой. Ей тоже хочется гулять! Возьми её с собой, сходите куда-нибудь.',
                  style: TextStyle(
                    color: blColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FavoriteWidget(),
        ],
      ),
    );

    return Scaffold(
      body: ListView(
        children: [
          Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 75, bottom: 15)),
          Image.asset(
            'images/1.png',
            width: 300,
            height: 300,
            fit: BoxFit.scaleDown,
          ),
          titleSection,
          buttonSection,
        ],
      ),
    );
  }
}

var itemx = Item(1, 'Dog');

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({required this.item, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? () {
              var cart = context.read<CartModel>();
              cart.remove(item);
            }
          : () {
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return null;
          }
          return null;
        }),
      ),
      child: isInCart
          ? Container(
              padding:
                  const EdgeInsets.only(right: 20, left: 20, top: 8, bottom: 8),
              child: Icon(Icons.check_box_outlined, color: blColor))
          : Container(
              padding:
                  const EdgeInsets.only(right: 20, left: 20, top: 8, bottom: 8),
              child: Icon(Icons.check_box_outline_blank_sharp, color: blColor)),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isPlaying = true;
  void _togglePlaying() {
    setState(() {
      if (_isPlaying) {
        _isPlaying = false;
      } else {
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AddButton(item: itemx),
        Container(
          padding: EdgeInsets.all(5),
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.arrow_back_ios),
            color: blColor,
            onPressed: () => Navigator.pushNamed(context, '/3'),
            iconSize: 24,
          ),
        ),
        Container(
            padding: EdgeInsets.all(17),
            child: Icon(Icons.arrow_forward_ios,
                size: 24, color: Color(0x55E5E5E5))),
        Container(
          padding: EdgeInsets.all(3),
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.notes),
            color: blColor,
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            iconSize: 24,
          ),
        ),
        SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
