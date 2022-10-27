import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_attimuitehoi_app/model/Hoi.dart';
import 'package:flutter_attimuitehoi_app/model/Result.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);



  @override
  State<ResultPage> createState() => _ResultPageState();
}

  String result = '';

  Future<void> goToTop(BuildContext context) async {
    Navigator.popUntil(context, (route) => route.isFirst);
  }


class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFffde59),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                const Text('YOU',style: TextStyle(fontSize: 100),),
              SecondResult == '勝ち' ?
                Text('WIN',style: TextStyle(fontSize: 150,color: Colors.red),):
                Text('LOSE',style: TextStyle(fontSize: 120,color: Colors.blue),
                ),

              ],
            ),
            

            ElevatedButton(
                onPressed: () async {
                  await goToTop(context);
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(40, 60),primary: Colors.black,elevation: 5,),
                child: Text('トップへ戻る',style: TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }
}

