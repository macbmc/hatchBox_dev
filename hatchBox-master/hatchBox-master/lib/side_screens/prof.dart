import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatch_box/function_screens/FileUpd.dart';
import 'package:hatch_box/main_screens/Home.dart';
import 'package:hatch_box/side_screens/contact.dart';
import 'package:hatch_box/main_screens/orders.dart';
import 'package:hatch_box/side_screens/update.dart';

class ProfP extends StatefulWidget {
  const ProfP({Key? key}) : super(key: key);

  @override
  State<ProfP> createState() => _ProfPState();
}

class _ProfPState extends State<ProfP> {
  final user = FirebaseAuth.instance.currentUser!;
  String? ImgPath, name,phno, email;
  Future getData()async{
    final DocumentSnapshot userDoc =await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      final _ImgPath=userDoc.get("image").toString();
     final _name=userDoc.get("name").toString();
     final _phno=userDoc.get("phoneno").toString();
     final _email=userDoc.get("email").toString();
     setState(() {
       ImgPath=_ImgPath;
       name=_name;
       phno=_phno;
       email=_email;
     });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getData());
  }
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return HomeP();
                          }));},
                            icon:Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                            iconSize: 30,
                            color: Colors.white,),
                        ),
                        Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                          ),
                          iconSize: 30,
                          onPressed: (){signout();},
                        ),
                      ],
                    ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container( width: 130,
                              height: 130,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              child:
                             ImgPath!=null? Image.network(
                                ImgPath!,
                                fit: BoxFit.fill,
                                width: 200,
                                height: 95,
                              )
                            :
                            Image.asset('assets/—Pngtree—cute panda_643086.png',)
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("$name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
                          Text("$phno",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.brown),),
                          Text("$email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),)
                        ],
                      )
                    ],
                  ),
                ),

                    /*Stack(alignment: Alignment.bottomRight,
                      children:[
                        Container(
                        width: 120,
                        height: 120,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        child: image !=null ? Image.file(image!,fit: BoxFit.cover,):Image.asset("assets/—Pngtree—cute panda_643086.png"),
                      ),
                        ElevatedButton(
                          onPressed: () {*//*pickImage();*//*},
                          child: Text('+',style: TextStyle(fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                        )
                      ]
                    ),*/
                    //Text(user.email.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("@Elixir",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return UpdateP();
                        }));},
                        child: Text('Edit Profile >>',style: TextStyle(fontSize: 19),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // <-- Radius
                          ),
                        ),
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){},
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
                              width: MediaQuery.of(context).size.width/2.9,
                              height: 80,
                              child: Row(
                                children: [
                                  Icon(Icons.settings,size: 28,color: Colors.brown,),
                                  Text(" Settings",style: TextStyle(fontSize: 17,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return Order();
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
                              width: MediaQuery.of(context).size.width/2.9,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.timer,size: 28,color: Colors.brown,),
                                  Text("Orders",style: TextStyle(fontSize: 17,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){},
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
                              width: MediaQuery.of(context).size.width/2.9,
                              height: 80,
                              child: Row(
                                children: [
                                  Icon(Icons.money,size: 28,color: Colors.brown,),
                                  Text("Payments",style: TextStyle(fontSize: 17,color: Colors.black54,fontWeight: FontWeight.bold),)
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
                              width: MediaQuery.of(context).size.width/2.9,
                              height: 80,
                              child: Row(
                                children: [
                                  Icon(Icons.phone,size: 28,color: Colors.brown,),
                                  Text("Grievances",style: TextStyle(fontSize: 17,color: Colors.black54,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              

                            ),
                          ),
                        ),
                      ],
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
  Future signout() async{
    await FirebaseAuth.instance.signOut();
  }

  }
class Profinfo extends StatelessWidget {
  @override
  String ImgPath, name;

  // ignore: use_key_in_widget_constructors
  Profinfo({

    // ignore: non_constant_identifier_names
    required this.ImgPath,
    required this.name,
    required this.phno,
    required this.email,

  });

  String phno, email;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Image.network(
                ImgPath,
                fit: BoxFit.contain,
                width: 200,
                height: 95,
              ),
            ],
          ),
          Column(
            children: [
              Text(name),
              Text(phno),
              Text(email)
            ],
          )
        ],
      ),
    );
  }
}
