import 'package:flutter/material.dart';
import 'package:flutter_attimuitehoi_app/view/TopPage.dart';
import 'package:flutter_attimuitehoi_app/view/MyHoiPage.dart';
import 'package:flutter_attimuitehoi_app/view/YourHoiPage.dart';
class Result extends StatelessWidget {
  

  Future<void> goToTop(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder:(context)  => TopPage()));
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //Columnの中に入れたものは縦に並べられる．Rowだと横に並べられる
          mainAxisAlignment: MainAxisAlignment.center, //Coloumの中身を真ん中に配置
          children: <Widget>[

           // Text('$SecondResult'),

            ElevatedButton(
                onPressed: () async {
                  await goToTop(context);
                },
                child: const Text('トップへ戻る')),
          ],
        ),
      ),
    );
  }
}