import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //Hazır MaterialApp widgetını kullanıyorum.
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:
          new MyCrossIntt(), //home kısmında alttaki classım çalışsın istiyorum.
    );
  }
}

class MyCrossIntt extends StatefulWidget {
  @override
  _MyCrossInttState createState() => _MyCrossInttState();
}

class _MyCrossInttState extends State<MyCrossIntt> {
  static const duration = const Duration(seconds: 1);
  int counter = 1; //1 dan 25 e count değerini tutacak
  List<int> valList = myList();

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    setState(() {
      secondsPassed = secondsPassed + 1;
    });
  }

  static List<int> myList() {
    List<int> numbers = List.generate(25, (index) => index + 1);
    numbers.shuffle();
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    String val;
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Sayı Bulmaca')),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 5,
          children: new List<Widget>.generate(25, (index) {
            val = valList[index].toString();
            return new GridTile(
              child: new InkWell(
                //Tıklandığında efekt verip renk değiştiriyor.

                splashColor: Colors.purple,
                onTap: () => onClickValues(index),
                child: new Card(
                  color: Colors.grey[300],
                  child: new Center(
                    child: new Text('$val'),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  onClickValues(int index) {
    if (valList[index] == counter) {
      setState(() {
        counter++;
      });
      print(valList[index].toString());
      if (valList[index] == 25) {
        counter = 1;
        print("oyun bitti");
      }
    }
  }
}
