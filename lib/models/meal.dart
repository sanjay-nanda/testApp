class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double noRatings;
  final double price;
  final bool isGlutenFree;
  final double weight;  

const Meal({
  this.id,
  this.imageUrl,
  this.isGlutenFree,
  this.noRatings,
  this.price,
  this.rating,
  this.title,
  this.weight
});
}