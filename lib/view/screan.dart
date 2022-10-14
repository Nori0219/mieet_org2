import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attimuitehoi_app/view/TopPage.dart';
import 'package:flutter_attimuitehoi_app/view/MyHoiPage.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';
import 'package:flutter_attimuitehoi_app/view/YourHoiPage.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex = 0;//選択している状態を表す0はホームアイコン,1はアカウントアイコン
  List<Widget> pageList = [JankenPage(),MyHoiPage(),YourHoiPage()];//それぞれの状態で表示するページを設定

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(//画面下にナビゲーションボタンを追加する
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: ''
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: ''
          ),
        ],
        currentIndex: selectedIndex,
        //タップすると画面が遷移するように
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //ボタンをしたらpostpageに遷移する
      //     Navigator.push(context, MaterialPageRoute(builder:(context)  => ()));
      //   },
      //   child: Icon(Icons.chat_bubble_outline),
      // ),
    );
  }
}