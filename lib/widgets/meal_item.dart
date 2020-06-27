import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double noRatings;
  final double price;
  final bool isGlutenFree;
  final double weight;

  const MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.rating,
      @required this.noRatings,
      @required this.weight,
      @required this.price,
      @required this.isGlutenFree});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
    );
  }
}
