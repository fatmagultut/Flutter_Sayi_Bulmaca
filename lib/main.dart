import 'dart:async';
import 'package:flutter/material.dart';

Stopwatch stopwatch;
void main() {
  stopwatch = Stopwatch();
  stopwatch.start();
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
  int counter = 1; //1 dan 25 e count değerini tutacak
  int next = 1;
  List<int> valList = myList();
  int _stopwatch = 0;

  static List<int> myList() {
    List<int> numbers = List.generate(25, (index) => index + 1);
    numbers.shuffle();
    return numbers;
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (next != 26) {
          _stopwatch =
              stopwatch.elapsed.inSeconds; //Ekranda süreyi göstermemi sağlıyor
        }
      });
    });

    String val;
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Sayı Bulmaca')),
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text('Time: $_stopwatch'),
                color: Colors.purple,
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: Text('Next: $next'),
                color: Colors.purple,
                padding: EdgeInsets.all(20),
              ),
            ],
          )
        ],
      ),
    );
  }

  onClickValues(int index) {
    if (valList[index] == counter) {
      setState(() {
        counter++;
        next = counter;
      });
      print(valList[index].toString());
      if (valList[index] == 25) {
        print("oyun bitti");
        stopwatch.stop();
      }
    }
  }
}
