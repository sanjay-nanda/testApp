import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/meal_items.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    List meal =
        mealsData.items.where((element) => element.inCart == true).toList();

    double _totalPrice = 0;

    for (int i = 0; i < meal.length; i++) {
      setState(() {
        _totalPrice = _totalPrice + meal[i].price;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: Navigator.of(context).pop),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              'Cart',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            child: Text(
              'Thu, 6th of June',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            margin: EdgeInsets.only(top: 25, left: 15),
          ),
          RaisedButton(
            onPressed: () {},
            elevation: 0,
            child: Text('+Add to Order'),
            color: Colors.white,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: meal == null ? 0 : meal.length,
              itemBuilder: (BuildContext context, int position) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              meal[position].imageUrl,
                              height: 80,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              meal[position].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '- 3 +',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text('\$ ${meal[position].price}'),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.amber,
                                ),
                                onPressed: () {
                                  setState(() {
                                    meal[position].removeFromCart();
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Total: ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                '\$ $_totalPrice',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              height: 50,
              width: 100,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Checkout'),
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
