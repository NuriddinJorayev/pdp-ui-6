import 'package:flutter/material.dart';
import 'package:pdpui6/animations/fade_animation.dart';

class Home extends StatefulWidget {
  final String id = "home_page";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool islogin = false;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/im_party.jpeg'),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.1),
                ])),
            child: Column(
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height / 9),
                FadeAnimation(
                    1200,
                    Text(
                      'Find the best parties near you.',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          height: 1.1),
                    ),
                    getWidth),
                SizedBox(height: 20.0),
                FadeAnimation(
                    1000,
                    Text(
                      "Let us find you a tutorial for your interest",
                      style: TextStyle(
                        color: Colors.cyanAccent[200],
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    getWidth),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      islogin
                          ? FadeAnimation(
                          1400,
                          Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.orange[600]),
                            child: Center(
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                )),
                          ),
                          getWidth)
                          : FadeAnimation(
                          1400,
                          SizedBox(
                            height: 50.0,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buttonBuider("Google", Colors.red),
                                SizedBox(width: 10.0),
                                _buttonBuider("facebook", Colors.blue),
                              ],
                            ),
                          ),
                          getWidth),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buttonBuider(String name, color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: color,
        ),
        child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            )),
      ),
    );
  }
}
