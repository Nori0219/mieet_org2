import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_attimuitehoi_app/model/imagePage.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class WipeClippter extends CustomClipper<Path> {
  const WipeClippter(this.progress) : super();

  final double progress;

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * progress,
        height: size.height,
      ))
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.yellow,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  ConstrainedBox(
                     constraints: BoxConstraints.expand(height: 100),
                    child: Card(
                      child: Center(child: const Text(
                        '本日の対戦相手',
                          style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      color: Colors.white70, // Card自体の色
                      margin: EdgeInsets.all(20),
                      elevation: 10, // 影の離れ具合
                      shadowColor: Colors.red, // 影の色
                      shape: RoundedRectangleBorder( // 枠線を変更できる
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(60), // Card左上の角に丸み
                          bottomRight: Radius.elliptical(40, 20), //Card左上の角の微調整
                          ),
                        ),
                      ),
                  ),
                  CarouselSlider(
                  items: [
                  GestureDetector(
                      onTap: (){ 
                      },//遷移の記述を書く
                      child: SizedBox(
                        child: Card(
                          child:  Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/icon.png'),
                                fit: BoxFit.fill,//画像の指定
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  GestureDetector(
                      onTap: (){
                        
                      },//遷移の記述を書く
                        child: Card(
                          child:  Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/face_smile_man2.png'), //画像の指定
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                    ),
                  GestureDetector(
                        onTap: (){
                          
                        },//遷移の記述を書く
                        child: Card(
                          child:  Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/point_down.png'), //画像の指定
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                    ),
                  GestureDetector(
                        onTap: (){
                          
                        },//遷移の記述を書く
                        child: Card(
                          child:  Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/point_right.png'), //画像の指定
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                    options: CarouselOptions(
                      height: 180.0,
                        initialPage: 0, //最初のページ
                        aspectRatio: 16/9,
                        enableInfiniteScroll: true, //無限スクロール
                        autoPlay: true, //自動スクロール
                        autoPlayInterval: Duration(seconds: 3), //スクロールのインターバル
                        autoPlayAnimationDuration: Duration(milliseconds: 1000), //スクロールの時間
                        autoPlayCurve: Curves.fastOutSlowIn, //スクロールの仕方
                        enlargeCenterPage:true, //真ん中を拡大表示
                        viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
              Container( //人のイラスト
                      height: 300,
                      child: appLog,
                      ),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return JankenPage();
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final opacity = Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ));
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return ClipPath(
                              clipper: WipeClippter(opacity.value),
                              child: child,
                            );
                          },
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(40, 90),primary: Colors.black,elevation: 5,),
                child: Text('START',style: TextStyle(fontSize: 50),),
              ),
            ],
          ),
        )

      ),
    );
  }
}




