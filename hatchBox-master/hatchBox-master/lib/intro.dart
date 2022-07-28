// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardPP extends StatefulWidget {
  @override
  _OnBoardPPState createState() => _OnBoardPPState();
}
class _OnBoardPPState extends State<OnBoardPP> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Container(
              width: 200,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Image.asset("assets/download (1).jpg",width: 130,)
          ),
          title:"",
          body: "AR allows ecommerce customers to preview products or experience services in their own environment and on their own time.",
          //footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.lime,
          )),
      PageViewModel(
        image: Container(
      width: 200,
    height: 200,

    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
    color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(40.0),
    ),
    child: Image.asset("assets/901df1b6b01b53244e94341f00754d95.jpg",width: 130,)
    ),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        decoration: PageDecoration(
          pageColor: Colors.lime
        )
      ),
      /*PageViewModel(
        image: Image.asset("images/demo3.png"),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("images/demo4.png"),
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),*/
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Introduction Screen"),
      ),*/
      body: IntroductionScreen(
        globalBackgroundColor: Colors.black,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        next: Text("Next",style: TextStyle(color: Colors.lime),),
        skip: Text("Skip",style: TextStyle(color: Colors.lime)),
        done: Text("Sign In",style: TextStyle(color: Colors.lime)),
        onDone: () {},
      ),
    );
  }
}
