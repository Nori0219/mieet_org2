import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_attimuitehoi_app/model/Hoi.dart';
import 'package:flutter_attimuitehoi_app/model/imagePage.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';
import 'package:flutter_attimuitehoi_app/view/ResultPage.dart';
import 'package:flutter_attimuitehoi_app/view/TopPage.dart';

class YourHoiPage extends StatefulWidget {
  const YourHoiPage({Key? key}) : super(key: key);

  @override
  State<YourHoiPage> createState() => _YourHoiPageState();
}




class _YourHoiPageState extends State<YourHoiPage> {
var computerDirection = People;
String myFace = '๐ค';
// String SecondResult ='ใใ็ดใ';

//ๆๅญๅใฎๅคๆฐใฏStringใจใใๅใงๅฎ็พฉใใใๆๅใฏๅฐๆๅญใงๆฌกใฏๅคงๆๅญ

//้ขๆฐใฎๅฎ็พฉ

dynamic selectHnd(String selectHnd) {
  myFace = handToFace(selectHnd);
  print(selectHnd);
  generateComputerDirection();
  judge();
  next();
  setState(() {});
}


void generateComputerDirection() {
  final randomNumber = Random().nextInt(4);
  computerDirection = randomNumberToHand(randomNumber);
  print(randomNumberToHand(randomNumber));
}

dynamic randomNumberToHand(int randomNumber) {
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

dynamic handToFace(String selectHnd) {
  switch  (selectHnd){
    case '๐':
      return '๐';
    case '๐':
      return '๐';
    case '๐':
      return '๐';
    case '๐':
      return '๐ง';
    default:
      return '๐ค';
  }
  
}



//  void judge() {
//    if (computerDirection == myFace) {
//      SecondResult ='ๅผใๅใ';
//    } else if ( myFace == 'โ' && computerDirection == 'โ') {
//        SecondResult = 'ๅใก';
//    } else if ( myFace == 'โ' && computerDirection == 'โ') {
//        SecondResult = 'ๅใก';
//    } else if ( myFace == 'โ' && computerDirection == 'โ') {
//        SecondResult = 'ๅใก';
//    }
//  }

 void judge() {
   if ( myFace == '๐' && computerDirection == Up||
       myFace == '๐' && computerDirection == Right||
       myFace == '๐ง' && computerDirection == Left||
       myFace == '๐' && computerDirection == Down) {
       SecondResult = '่ฒ?ใ';
       print('Lose');
   }else {
    SecondResult = 'ใใ็ดใ';
   }
 }

 void next(){
    if (SecondResult == '่ฒ?ใ') {
      print('ใใชใใฎ่ฒ?ใใงใ');
      Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)  => ResultPage()));
      
      });
      
    } else if (SecondResult == 'ใใ็ดใ'){
      Future.delayed(Duration(seconds: 2), () {
        print('ใใชใใฎใใ็ดใใงใ');
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
                myFace == '๐ค' ?//ๅๆๅคใใไปฃใใใจๆๅญใไปฃใใ
                  Text('ใใฃใกใใใฆ',style: TextStyle(fontSize: 50,),):Text('ใใค๏ผ',style: TextStyle(fontSize: 60,),),
                  SizedBox(
                    height: 25,
                  ),
                  Container( 
                    height: 200,
                    child: computerDirection),
                
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
                  myFace,
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
                                  // myFace ='โ';
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
                                  // myFace ='โ';
                                  // print('โ');
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('๐',style: TextStyle(fontSize: 30),),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  selectHnd('๐');
                                  // myFace ='โ';
                                  // print('โ');๐
                                  // setState(() {});
                                },
                                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                                child: Text('๐',style: TextStyle(fontSize: 30),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 13.0),
                            child: ElevatedButton(
                              onPressed: (){
                                selectHnd('๐');
                                // myFace ='โ';
                                // print('โ');
                                // setState(() {});
                              },
                              style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.white,elevation: 5,),
                              child: Text('๐',style: TextStyle(fontSize: 30),),
                            ),
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