
import 'package:flutter/material.dart';

class ThreadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Thread'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
            'assets/graphics/thread.jpg'
        ),
      )
    );
  }
}