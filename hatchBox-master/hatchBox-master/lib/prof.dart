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
                      color: Color.fromRGBO(210, 65, 133, 1),
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
                        IconButton(onPressed:(){},color: Colors.white, icon:Icon(Icons.power_settings_new))
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
                    Container(
                      width: 500,
                      height: 1,
                      color: Colors.yellow,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:  Icon(Icons.settings,color: Colors.white,size: 28,),
                          ),
                          Text("Settings",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueGrey,size: 28,),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:  Icon(Icons.payment_outlined,color: Colors.white,size: 28,),
                          ),
                          Text("Card Info",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueGrey,size: 28,),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Order();
                        }));},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:  Icon(Icons.timer,color: Colors.white,size: 28,),
                          ),
                          Text("Orders   ",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueGrey,size: 28,),
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      height: 1,
                      color: Colors.yellow,
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              border: Border.all(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:  Icon(Icons.phone,color: Colors.white,size: 28,),
                          ),
                          Text("Contact Us",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueGrey,size: 28,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
