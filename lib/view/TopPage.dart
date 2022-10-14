import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_attimuitehoi_app/view/JankenPage.dart';

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                style: ElevatedButton.styleFrom(minimumSize: Size(70, 70),primary: Colors.black,elevation: 5,),
                child: Text('START',style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
        ],
      )

    );
  }
}




