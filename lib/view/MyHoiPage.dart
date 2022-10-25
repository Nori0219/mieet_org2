import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_attimuitehoi_app/model/Hoi.dart';
import 'package:flutter_attimuitehoi_app/model/imagePage.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';
import 'package:flutter_attimuitehoi_app/view/ResultPage.dart';

class MyHoiPage extends StatefulWidget {
  const MyHoiPage({Key? key}) : super(key: key);

  @override
  State<MyHoiPage> createState() => _MyHoiPageState();
}




class _MyHoiPageState extends State<MyHoiPage> {
var computerFace = People;
String myHand = '👊';
// String SecondResult ='やり直し';

//文字列の変数はStringという型で定義する　最初は小文字で次は大文字

//関数の定義
void selectHnd(String selectHnd) {
  myHand =selectHnd;
  generateComputerFace();
  judge();
  next();
  setState(() {});
}


void generateComputerFace() {
  final randomNumber = Random().nextInt(4);
  computerFace = randomNumberToFace(randomNumber);
  print(randomNumberToFace(randomNumber));
}

dynamic randomNumberToFace(int randomNumber) {
  switch (randomNumber) {
    case 0:
      return Up;
    case 1:
      return Down;
    case 2:
      return Right;
    case 3:
      return Left;
    default:
      return People;
  }
  
}




//  void judge() {
//    if (computerFace == myHand) {
//      SecondResult ='引き分け';
//    } else if ( myHand == '✊' && computerFace == '✌') {
//        SecondResult = '勝ち';
//    } else if ( myHand == '✌' && computerFace == '✋') {
//        SecondResult = '勝ち';
//    } else if ( myHand == '✋' && computerFace == '✊') {
//        SecondResult = '勝ち';
//    }
//  }
 void judge() {
   if ( myHand == '👆' && computerFace == Up||
       myHand == '👉' && computerFace == Right||
       myHand == '👈' && computerFace == Left||
       myHand == '👇' && computerFace == Down) {
       SecondResult = '勝ち';
       print('Win');
   }else {
    SecondResult = 'やり直し';
    print('やり直し');
   }
 }

 void next(){
    if (SecondResult == '勝ち') {
      print('あなたの勝ちです');
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => ResultPage()));
      });
      
    } else if (SecondResult == 'やり直し'){
      print('やり直しです');
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => JankenPage()));
    });
      
    }else { 

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFffde59),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,//縦のcenerに縦並び
              children: [
                myHand == '👊' ?//初期値から代わると文字が代わる
                  Text('あっちむいて',style: TextStyle(fontSize: 50,),):Text('ホイ！',style: TextStyle(fontSize: 60,),),
                  
                  Container( 
                    height: 200,
                    child: computerFace),
                
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      Expanded(
                        child: Container(
                            color: Colors.black,
                            height: 7,
                          ),
                      ),
                      const Text('VS',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                      textDirection: TextDirection.ltr,),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          height: 7,
                        ),
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
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Color.fromARGB(255, 32, 169, 211),width: 6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 350, height: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text( 
                      '方向を選んで！',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          ElevatedButton(
                                onPressed: (){
                                  selectHnd('👆');
                                  // myHand ='✌';
                                  // print('✌');
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('👆',style: TextStyle(fontSize: 30),),
                              ),
                          Row(//横並び
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              ElevatedButton(
                                onPressed: (){
                                  selectHnd('👈');
                                  // myHand ='✌';
                                  // print('✌');
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('👈',style: TextStyle(fontSize: 30),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  selectHnd('👉');
                                  // myHand ='✋';
                                  // print('✋');👉
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('👉',style: TextStyle(fontSize: 30),),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: (){
                              selectHnd('👇');
                              // myHand ='✌';
                              // print('✌');
                              // setState(() {});
                            },
                            style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                            child: Text('👇',style: TextStyle(fontSize: 30),),
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
      ),
    );
  }
}