
import 'package:flutter/material.dart';

class ThreadView extends StatelessWidget {
  FocusNode _textNode = new FocusNode();
  BuildContext _context;

  handleKey(RawKeyEvent key) {
    print("Event runtimeType is ${key.runtimeType}");
    if(key.runtimeType.toString() == 'RawKeyDownEvent'){
      Navigator.pop(_context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    FocusScope.of(context).requestFocus(_textNode);

    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: handleKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Thread'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Image.asset(
              'assets/graphics/thread.jpg'
          ),
        )
      ),
    );
  }
}