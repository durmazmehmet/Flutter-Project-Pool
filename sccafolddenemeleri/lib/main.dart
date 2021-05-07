import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Genel erişim açısından oop mantığı
class CommonThings {
  static Size size;
  static double fontScale;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => new _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  double _height;
  double _initHeight;
  bool _status;

  @override
  void initState() {
    _initHeight = 20;
    _height = _initHeight;
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          if (details.scale > 1) {
            _height = _initHeight + (_initHeight * (details.scale * .35));
          } else {
            _height = _initHeight - (_initHeight * (details.scale * .35));
          }
          print("scale=${details.scale} height=$_height ih=$_initHeight");
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(
          () {
            _initHeight = _height;
          },
        );
      },
      onDoubleTap: () {
        setState(
          () {
            _height = 100;
            _initHeight = _height;
            print("Double Clicked");
          },
        );
      },
      // TODO: Gestureye konu olacak widget iskelesini burda kur
      child: new Scaffold(
        appBar: AppBar(
          title: Text("Deneme"),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          // TODO: Gestureden aldığımız değerle ebadı değişecek bir sizedBox
          // lazım
          child: new SizedBox(
            height: _height,
            // TODO: Sizedbox içine cuk oturacak bi widget lazım
            child: new FittedBox(
              // TODO: text fittedbox ile büyüyüp küçülecek
              child: Text("Bas $count"),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                count++;
              },
            );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
