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
String myHand = '๐';
// String SecondResult ='ใใ็ดใ';

//ๆๅญๅใฎๅคๆฐใฏStringใจใใๅใงๅฎ็พฉใใใๆๅใฏๅฐๆๅญใงๆฌกใฏๅคงๆๅญ

//้ขๆฐใฎๅฎ็พฉ
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
//      SecondResult ='ๅผใๅใ';
//    } else if ( myHand == 'โ' && computerFace == 'โ') {
//        SecondResult = 'ๅใก';
//    } else if ( myHand == 'โ' && computerFace == 'โ') {
//        SecondResult = 'ๅใก';
//    } else if ( myHand == 'โ' && computerFace == 'โ') {
//        SecondResult = 'ๅใก';
//    }
//  }
 void judge() {
   if ( myHand == '๐' && computerFace == Up||
       myHand == '๐' && computerFace == Right||
       myHand == '๐' && computerFace == Left||
       myHand == '๐' && computerFace == Down) {
       SecondResult = 'ๅใก';
       print('Win');
   }else {
    SecondResult = 'ใใ็ดใ';
    print('ใใ็ดใ');
   }
 }

 void next(){
    if (SecondResult == 'ๅใก') {
      print('ใใชใใฎๅใกใงใ');
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => ResultPage()));
      });
      
    } else if (SecondResult == 'ใใ็ดใ'){
      print('ใใ็ดใใงใ');
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
              mainAxisAlignment: MainAxisAlignment.start,//็ธฆใฎcenerใซ็ธฆไธฆใณ
              children: [
                myHand == '๐' ?//ๅๆๅคใใไปฃใใใจๆๅญใไปฃใใ
                  Text('ใใฃใกใใใฆ',style: TextStyle(fontSize: 50,),):Text('ใใค๏ผ',style: TextStyle(fontSize: 60,),),
                  
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
                      'ๆนๅใ้ธใใง๏ผ',
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget> [
                          ElevatedButton(
                                onPressed: (){
                                  selectHnd('๐');
                                  // myHand ='โ';
                                  // print('โ');
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('๐',style: TextStyle(fontSize: 30),),
                              ),
                          Row(//ๆจชไธฆใณ
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              ElevatedButton(
                                onPressed: (){
                                  selectHnd('๐');
                                  // myHand ='โ';
                                  // print('โ');
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('๐',style: TextStyle(fontSize: 30),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  selectHnd('๐');
                                  // myHand ='โ';
                                  // print('โ');๐
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('๐',style: TextStyle(fontSize: 30),),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: (){
                              selectHnd('๐');
                              // myHand ='โ';
                              // print('โ');
                              // setState(() {});
                            },
                            style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                            child: Text('๐',style: TextStyle(fontSize: 30),),
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