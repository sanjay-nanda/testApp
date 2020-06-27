import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final int noRatings;
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
      margin: EdgeInsets.symmetric(horizontal: 15),
      elevation: 0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.network(
              imageUrl,
              height: 150,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 26),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          isGlutenFree
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5,right: 76),
                      child: Text(
                        'GLUTEN-FREE',
                        style: TextStyle(
                          color: Colors.greenAccent[400],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: RatingBar(
                            itemSize: 20,
                            onRatingUpdate: null,
                            initialRating: rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            unratedColor: Colors.black,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6, left: 15),
                          child: Text('(${noRatings.toString()})'),
                        ),
                      ],
                    ),
                   /*  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            '\$ $price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.add_box,
                                color: Colors.amber,
                                size: 29,
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ) */
                  ],
                )
              : Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: RatingBar(
                        itemSize: 20,
                        onRatingUpdate: null,
                        initialRating: rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        unratedColor: Colors.black,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, left: 15),
                      child: Text('(${noRatings.toString()})'),
                    ),
                  ],
                ),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Text(
                            '\$ $price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.add_box,
                                color: Colors.amber,
                                size: 29,
                              ),
                              onPressed: () {}),
                        )
                      ],
                    )
        ],
      ),
    );
  }
}
