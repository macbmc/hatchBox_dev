import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/orders.dart';
import 'package:hatch_box/update.dart';
class ProfP extends StatefulWidget {
  const ProfP({Key? key}) : super(key: key);

  @override
  State<ProfP> createState() => _ProfPState();
}

class _ProfPState extends State<ProfP> {
  final user = FirebaseAuth.instance.currentUser!;
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
                      width: 120,
                      height: 120,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Image.asset("assets/—Pngtree—cute panda_643086.png"),
                    ),
                    Text(user.email.toString(),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("@Elixir Techz",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
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
