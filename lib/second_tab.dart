import 'package:flutter/material.dart';


class SecondNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 80,child: RaisedButton(onPressed: (){}, child: Text('All'), color: Colors.white, elevation: 0,)),
        Container(width: 80,child: RaisedButton(onPressed: (){},child: Text('Salad'), color: Colors.white, elevation: 0,)),
        Container(width: 80,child: RaisedButton(onPressed: (){},child: Text('Pizza'), color: Colors.white, elevation: 0,)),
        Container(width: 80,child: RaisedButton(onPressed: (){},child: Text('Asian'), color: Colors.white,elevation: 0,)),
        Container(width: 80,child: RaisedButton(onPressed: (){},child: Text('Burger'), color: Colors.white, elevation: 0,)),
      ],
    );
  }
}