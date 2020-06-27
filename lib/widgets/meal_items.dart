import 'package:flutter/foundation.dart';
import '../models/meal.dart';

class Meals with ChangeNotifier{
  List<Meal> DUMMY_MEALS =  [
  Meal(
    id: 'm1',
    title: 'Vegetables and Poached Egg',
    rating: 3,
    noRatings: 12,
    price: 13.5,
    imageUrl: 'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/butter-poached_egg_in_a_26822_16x9.jpg',
    weight: 100,
    isGlutenFree: false,
  ),
  Meal(
    id: 'm2',
    title: 'Avacado Salad',
    rating: 4,
    noRatings: 25,
    price: 19.28,
    imageUrl: 'https://www.lecremedelacrumb.com/wp-content/uploads/2019/11/chicken-avocado-salad-5sm-2.jpg',
    weight: 100,
    isGlutenFree: true,
  ),
  Meal(
    id: 'm3',
    title: 'Pancakes with Orange Sauce',
    rating: 4,
    noRatings: 22,
    price: 9.5,
    imageUrl: 'https://www.lavenderandmacarons.com/wp-content/uploads/2016/04/best-banana-pancakes-wth-orange-sauce.jpg',
    weight: 100,
    isGlutenFree: false,
  ),
  Meal(
    id: 'm4',
    title: 'Vegetables Salad',
    rating: 2,
    noRatings: 12,
    price: 13.5,
    imageUrl: 'https://dizzybusyandhungry.com/wp-content/uploads/2019/05/fruit-and-veggie-salad-title-pin.jpg',
    weight: 250,
    isGlutenFree: false,
  )
];

List<Meal> get items{
  return [...DUMMY_MEALS];
}

}