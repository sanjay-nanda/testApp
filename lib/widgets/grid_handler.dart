import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dummy.dart';
import '../widgets/meal_item.dart';
import './meal_items.dart';

class GridHandler extends StatefulWidget {
  @override
  _GridHandlerState createState() => _GridHandlerState();
}

class _GridHandlerState extends State<GridHandler> {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    final meals = mealsData.items;
    return Flexible(
          child: GridView.builder(
            physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4 / 2, 
        ),
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: meals[index],
          child: MealItem(),
        ),
        itemCount: meals.length,
      ),
    );
  }
}
