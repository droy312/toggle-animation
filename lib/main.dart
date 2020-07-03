import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle Animation',
      debugShowCheckedModeBanner: false,
      home: ToggleAnimation(),
    );
  }
}class ToggleAnimation extends StatefulWidget {
  ToggleAnimation({Key key}) : super(key: key);

  @override
  _ToggleAnimationState createState() => _ToggleAnimationState();
}

class _ToggleAnimationState extends State<ToggleAnimation> {
  Color bgColor = Color(0xfff2b72c);

  Color color1, color2, color3, color4, color5;

  Color color1_1 = Color(0xfff05a29);
  Color color1_2 = Color(0xff8c2908);
  Color color1_3 = Color(0xffed6c42);
  Color color1_4 = Color(0xffbf451d);

  Color color2_1 = Color(0xff1fd157);
  Color color2_2 = Color(0xff076324);
  Color color2_3 = Color(0xff20d659);
  Color color2_4 = Color(0xff0b8a32);

  Alignment buttonAlignment = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();

    color1 = color1_1;
    color2 = color1_2;
    color3 = color1_3;
    color4 = color1_4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(0, 30), blurRadius: 40),
            ],
          ),
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 1),
            width: 170,
            height: 70,
            alignment: buttonAlignment,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color2,
                  color1,
                ],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  buttonAlignment = buttonAlignment == Alignment.centerLeft
                      ? Alignment.centerRight
                      : Alignment.centerLeft;
                  
                  color1 = color1 == color1_1 ? color2_1 : color1_1;
                  color2 = color2 == color1_2 ? color2_2 : color1_2;
                  color3 = color3 == color1_3 ? color2_3 : color1_3;
                  color4 = color4 == color1_4 ? color2_4 : color1_4;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
                width: 67,
                height: 67,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      color3,
                      color4,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 0),
                        blurRadius: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
