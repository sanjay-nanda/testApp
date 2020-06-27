import 'package:flutter/material.dart';
import 'package:testApp/cart_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CartScreen()));
        },
        child: Text('Cart'),
      ),
    );
  }
}
