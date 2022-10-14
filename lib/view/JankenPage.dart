import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_attimuitehoi_app/model/imagePage.dart';
import 'package:flutter_attimuitehoi_app/view/MyHoiPage.dart';
import 'package:flutter_attimuitehoi_app/view/YourHoiPage.dart';

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
//StatefulWidgetは変数を扱える
//変数は@overrideよりも上に書く
//ホットリロードの対象外であるので右上のリロードボタンを押す
String computerHand = '👐';
String myHand = '✋';
String FirstResult ='引き分け';
String JankenVoice = '最初はグーじゃんけん';


//文字列の変数はStringという型で定義する　最初は小文字で次は大文字

//関数の定義
void selectHnd(String selectHnd) {
  myHand =selectHnd;
  //print(selectHnd);
  generateComputerHand();
  judge();
  next();
  setState(() {});
}


void generateComputerHand() {
  final randomNumber = Random().nextInt(3);
  computerHand = randomNumberToHand(randomNumber);
  print(randomNumberToHand(randomNumber));
}

String randomNumberToHand(int randomNumber) {
  switch (randomNumber) {
    case 0:
      return '✊';
    case 1:
      return '✌';
    case 2:
      return '✋';
    default:
      return '✊';
  }
  
}


//  void judge() {
//    if (computerHand == myHand) {
//      FirstResult ='引き分け';
//    } else if ( myHand == '✊' && computerHand == '✌') {
//        FirstResult = '勝ち';
//    } else if ( myHand == '✌' && computerHand == '✋') {
//        FirstResult = '勝ち';
//    } else if ( myHand == '✋' && computerHand == '✊') {
//        FirstResult = '勝ち';
//    }
//  }
 void judge() {
   if (computerHand == myHand) {
     FirstResult ='引き分け';
   } else if ( myHand == '✊' && computerHand == '✌'||
       myHand == '✌' && computerHand == '✋'||
       myHand == '✋' && computerHand == '✊') {
       FirstResult = '勝ち';
   }else {
    FirstResult = '負け';
   }
 }

  void next(){
    if (FirstResult == '勝ち') {
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => MyHoiPage()));
      });
      
    } else if (FirstResult == '負け'){
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => YourHoiPage()));
    });
      
    }else { 
      JankenVoice = '勝負で';
    }
  }

Text JankenVoiceText() { // Textウィジェットを返す関数
  if (FirstResult == '引き分け') {
    return Text(JankenVoice,style: TextStyle(fontSize: 42,),);
  } else {
    return Text('ポン！',style: TextStyle(fontSize: 42,),);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('じゃんけん'),
      // ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,//縦のcenerに縦並び
                children: [
                  JankenVoiceText(),
                  // ReadyState == 0 ?//初期値から代わると文字が代わる
                  // Text(ready,style: TextStyle(fontSize: 40,),):Text('ポン！',style: TextStyle(fontSize: 60,),),
                    SizedBox(
                      height: 40
                      ,
                    ),
                    Container( //人のイラスト
                    height: 200,
                    child: People
                    ),
                    SizedBox(
                      height: 30
                      ,
                    ),
                  Text(
                    computerHand,//相手の手
                    style: TextStyle(
                      fontSize: 70,
                    ),
                    ),
                    Container(
                      height: 100,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                        Container(
                            color: Colors.black,
                            height: 7,
                            width: 140,
                          ),
                        const Text('VS',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                        textDirection: TextDirection.ltr,),
                        Container(
                          color: Colors.black,
                          height: 7,
                          width: 140,
                        )
                        ],
                      )
                    ),
                  Text(
                    myHand,
                    style: TextStyle(
                      fontSize: 80,
                    ),
                    ),
                    Container(
                      height: 50,//columとRawの間に隙間を取る
                  
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border: Border.all(color: Color.fromARGB(255, 32, 169, 211),width: 6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: 350, height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('出す手を選んで！',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Row(//横並び
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//等間隔に中央揃え
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                selectHnd('✊');
                                // myHand ='✊';//変数に代入
                                // print('✊');
                                // setState(() {});//画面上で変数の変更を表示させる
                              },
                              style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                              
                              child: Text('✊',style: TextStyle(fontSize: 30),),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                selectHnd('✌');
                                // myHand ='✌';
                                // print('✌');
                                // setState(() {});
                              },
                              style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                              child: Text('✌',style: TextStyle(fontSize: 30),),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                selectHnd('✋');
                                // myHand ='✋';
                                // print('✋');
                                // setState(() {});
                              },
                              style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                              child: Text('✋',style: TextStyle(fontSize: 30),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
        ),
      ),
    );
  }
}
