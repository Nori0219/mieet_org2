import 'package:flutter/material.dart';

class Result {
  var firstResult;
  var secondResult;
}

class ResultPage extends StatelessWidget {
  final String result;
  ResultPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("item detail"),
      ),
      body: Center(
        child: Text("this page is item$result"),
      ),
    );
  }
}