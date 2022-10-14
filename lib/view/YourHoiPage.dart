import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class YourHoiPage extends StatefulWidget {
  const YourHoiPage({Key? key}) : super(key: key);

  @override
  State<YourHoiPage> createState() => _YourHoiPageState();
}




class _YourHoiPageState extends State<YourHoiPage> {
String computerHand = '✊';
String myHand = '👊';
String result ='引き分け';

//文字列の変数はStringという型で定義する　最初は小文字で次は大文字

//関数の定義
void selectHnd(String selectHnd) {
  myHand =selectHnd;
  //print(selectHnd);
  generateComputerHand();
  judge();
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
//      result ='引き分け';
//    } else if ( myHand == '✊' && computerHand == '✌') {
//        result = '勝ち';
//    } else if ( myHand == '✌' && computerHand == '✋') {
//        result = '勝ち';
//    } else if ( myHand == '✋' && computerHand == '✊') {
//        result = '勝ち';
//    }
//  }
 void judge() {
   if (computerHand == myHand) {
     result ='引き分け';
   } else if ( myHand == '✊' && computerHand == '✌'||
       myHand == '✌' && computerHand == '✋'||
       myHand == '✋' && computerHand == '✊') {
       result = '勝ち';
   }else {
    result = '負け';
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,//縦のcenerに縦並び
              children: [
                myHand == '👊' ?//初期値から代わると文字が代わる
                  Text('あっちむいて',style: TextStyle(fontSize: 50,),):Text('ホイ！',style: TextStyle(fontSize: 60,),),
                  SizedBox(
                    height: 25,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage://　アイコンを変更　//URLの画像に設定
                    NetworkImage('https://ukiuki.itembox.design/item/img/osaru/img_header_icon.png'),
                  ),
                  SizedBox(
                    height: 30
                    ,
                  ),
                // Text(
                //   computerHand,//相手の手
                //   style: TextStyle(
                //     fontSize: 70,
                //   ),
                //   ),
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
                    height: 20,//columとRawの間に隙間を取る
                
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