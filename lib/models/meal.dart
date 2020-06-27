import 'package:flutter/foundation.dart';


class Meal with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final int noRatings;
  final double price;
  final bool isGlutenFree;
  final double weight;  
  bool inCart;

 Meal({
  this.id,
  this.imageUrl,
  this.isGlutenFree,
  this.noRatings,
  this.price,
  this.rating,
  this.title,
  this.weight,
  this.inCart
});

void addInCart(){
  inCart = true;
  notifyListeners();
}

void removeFromCart(){
 inCart = false;
 notifyListeners(); 
}

}

