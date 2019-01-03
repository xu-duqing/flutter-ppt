import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppt/camera.dart';

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
      home: MyHomePage(title: 'Flutter System Overview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode _textNode = new FocusNode();
  int _keyCode = 0;

  handleKey(RawKeyEvent key) {
    print("Event runtimeType is ${key.runtimeType}");
    if(key.runtimeType.toString() == 'RawKeyDownEvent'){
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      setState(() {
        _keyCode = data.keyCode;
      });
      print("why does this run twice $_keyCode");
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_textNode);

    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: handleKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                  margin: EdgeInsets.all(8),
                  color: Color.fromRGBO(172,211,188,1),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Framework', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Dart')
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    FrameworkWidget(title: 'Material'),
                                    FrameworkWidget(title: 'Cupertino'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    FrameworkWidget(title: 'Widgets'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    FrameworkWidget(title: 'Rendering'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    FrameworkWidget(title: 'Animation'),
                                    FrameworkWidget(title: 'Painting'),
                                    FrameworkWidget(title: 'Gestures'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    FrameworkWidget(title: 'Foundation')
                                  ],),
                              ),
                            ],
                          ),
                        )

                  ])
              ),
            ),
            Expanded(
              flex: 4,
              child: new Container(
                  margin: EdgeInsets.all(8),
                  color: new Color.fromRGBO(210,222,245	,1),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Engine', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('C++')
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EngineWidget(title: 'Service Protocol'),
                                    EngineWidget(title: 'Composition'),
                                    EngineWidget(title: 'Platform Channels'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EngineWidget(title: 'Dart Lsolate Setup'),
                                    EngineWidget(title: 'Rendering'),
                                    EngineWidget(title: 'System Events'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EngineWidget(title: 'Dart VM'),
                                    EngineWidget(title: 'Frame Scheduling'),
                                    EngineWidget(title: 'Asset Resolution'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EngineWidget(title: 'Frame Pipelining'),
                                    EngineWidget(title: 'Text Layout'),
                                  ],),
                              ),
                            ],
                          ),
                        )

                      ])
              ),
            ),
            Expanded(
              flex: 2,
              child: new Container(
                  margin: EdgeInsets.all(8),
                  color: new Color.fromRGBO(243,227,188,1),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Enbedder', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EmbedderWidget(title: 'Render Surface'),
                                    EmbedderWidget(title: 'Native Plugins'),
                                    EmbedderWidget(title: 'Packaging'),
                                  ],),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    EmbedderWidget(title: 'Thread Setup'),
                                    EmbedderWidget(title: 'Event Loop'),
                                  ],),
                              )
                            ],
                          ),
                        )

                      ])
              ),
            )
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new CameraWidget()));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class FrameworkWidget extends StatelessWidget {
  final String title;
  const FrameworkWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(49,111,56,1),
        child: Text(title),
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

class EngineWidget extends StatelessWidget {
  final String title;
  const EngineWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(50,	110, 232	,1),
        child: Text(title),
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

class EmbedderWidget extends StatelessWidget {
  final String title;
  const EmbedderWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Color.fromRGBO(230,	164,	57	,1),
        child: Text(title),
        margin: EdgeInsets.all(5),
      ),
    );
  }
}
