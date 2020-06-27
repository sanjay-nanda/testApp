import 'package:flutter/material.dart';
import '../dummy.dart';
import '../widgets/meal_item.dart';

class GridHandler extends StatefulWidget {
  @override
  _GridHandlerState createState() => _GridHandlerState();
}

class _GridHandlerState extends State<GridHandler> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
          child: GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4 / 2, 
        ),
        padding: EdgeInsets.all(10),
        children: DUMMY_MEALS
            .map((e) => MealItem(
                  id: e.id,
                  weight: e.weight,
                  title: e.title,
                  isGlutenFree: e.isGlutenFree,
                  rating: e.rating,
                  imageUrl: e.imageUrl,
                  price: e.price,
                  noRatings: e.noRatings,
                ))
            .toList(),
      ),
    );
  }
}
