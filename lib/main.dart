import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //Hazır MaterialApp widgetını kullanıyorum.
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
  int counter = 0; //0 dan 25 e count değerini tutacak

  void incrementCounter() {
    setState(() {
      //setState() StatefulWidgetlarda ekranın yeniden çizilmesini sağlıyor.
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Sayı Bulmaca')),
      ),
      body: new GridView.count(
        crossAxisCount: 5,
        children: new List<Widget>.generate(25, (index) {
          return new GridTile(
            child: new InkWell(
              //Tıklandığında efekt verip renk değiştiriyor.

              splashColor: Colors.purple,
              onTap: () {
                print('$index');
              },
              child: new Card(
                color: Colors.grey[300],
                child: new Center(
                  child: new Text('$index'),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
