import 'package:flutter/material.dart';
import 'package:hatch_box/side_screens/prof.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                right: -30,
                child: Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width * 1.2,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(220, 212, 211, 1),
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(250))),
                ),
              ),
              Positioned(
                right: -30,
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 1.2,
                  decoration: const BoxDecoration(
                    //color: Color.fromRGBO(210, 65, 133, 1),
                      color: Colors.brown,
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(500))),
                ),
              ),
              Container(
                //color: Colors.white,
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(onPressed:(){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
              return ProfP();
              }));
              },
                            icon:Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                            iconSize: 30,
                            color: Colors.white,),
                        ),
                        Text("Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        SizedBox(width: 30,)
                      ],
                    ),


                        GestureDetector(
                          onTap: () {launchEmail();},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: 200,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.timer,size: 28,color: Colors.brown,),
                                  Text("Email",style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            CALL("tel:7306548414");
                            },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: 200,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.timer,size: 28,color: Colors.brown,),
                                  Text("Call",style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            launchurl();
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: 200,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.timer,size: 28,color: Colors.brown,),
                                  Text("Whatsapp",style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Contact();
                          }));},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              width: 200,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.timer,size: 28,color: Colors.brown,),
                                  Text("Website",style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),


                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> CALL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "cannot launch $url";
    }
  }

  launchurl() async {
    const url = 'https://wa.me/919446862068?text=Hoiii';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "cannot launch $url";
    }
  }

  launchEmail() async {
    launchUrlString(
      'mailto:macflutter17@gmail.com?subject=TestEmail&body=hi',
    );
  }
}