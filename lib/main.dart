import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testApp/models/meal.dart';
import 'package:testApp/second_screen.dart';
import 'package:testApp/widgets/meal_items.dart';
import './widgets/grid_handler.dart';
import 'second_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Meals(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _controller;
  AnimationController _animationControllerOn;
  AnimationController _animationControllerOff;
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;
  int _currentIndex = 0;
  int _prevControllerIndex = 0;
  double _aniValue = 0.0;
  double _prevAniValue = 0.0;
  int _selectedIndex = 0;

  final List<Meal> _cartItems = [];

  // these will be our tab icons. You can use whatever you like for the content of your buttons
  List _text = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4', 'Tab 5', 'Tab 6'];

  // active button's foreground color
  Color _foregroundOn = Colors.black;
  Color _foregroundOff = Colors.black;
  Color _backgroundOn = Colors.amber;
  Color _backgroundOff = Colors.grey[300];
  ScrollController _scrollController = new ScrollController();
  List _keys = [];
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < _text.length; index++) {
      _keys.add(new GlobalKey());
    }
    _controller = TabController(vsync: this, length: _text.length);
    _controller.animation.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);
    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);
    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.search,
            color: Colors.black26,
            size: 26,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
              size: 26,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
              height: 49.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _text.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        key: _keys[index],
                        padding: EdgeInsets.all(6.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                          animation: _colorTweenBackgroundOn,
                          builder: (context, child) => FlatButton(
                              color: _getBackgroundColor(index),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0)),
                              onPressed: () {
                                setState(() {
                                  _buttonTap = true;
                                  _controller.animateTo(index);
                                  _setCurrentIndex(index);
                                  _scrollTo(index);
                                });
                              },
                              child: Text(
                                _text[index],
                                style: TextStyle(
                                  color: _getForegroundColor(index),
                                ),
                              )),
                        )));
                  })),
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Column(
                  children: [
                    SecondNav(),
                    GridHandler(),
                  ],
                ),
                SecondScreen(),
                Icon(Icons.stop),
                Icon(Icons.sms),
                Icon(Icons.smartphone),
                Icon(Icons.slideshow)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(
            selectedItemColor: Colors.amber,
            items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), title: Text('Menu')),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Account')),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title: Text('Cart') )
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation.value;
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }
    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;
    double position = renderBox.localToGlobal(Offset.zero).dx;
    double offset = (position + size / 2) - screenWidth / 2;
    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      if (position > offset) offset = position;
    } else {
      renderBox = _keys[_text.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      size = renderBox.size.width;
      if (position + size < screenWidth) screenWidth = position + size;
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}
