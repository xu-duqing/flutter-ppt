import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppt/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  FocusNode _textNode = new FocusNode();
  BuildContext _context;

  _handleKey(RawKeyEvent key) {
    print("Event runtimeType is ${key.runtimeType}");
    if(key.runtimeType.toString() == 'RawKeyDownEvent'){
      Navigator.push(_context, new MaterialPageRoute(builder: (context) => new OverviewPage(title: 'Flutter System Overview')));
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    FocusScope.of(context).requestFocus(_textNode);

    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: _handleKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter PPT'),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.black87,
          child: Text('废物利用 - 树莓派',
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}