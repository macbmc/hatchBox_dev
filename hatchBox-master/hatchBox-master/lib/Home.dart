// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/cart.dart';
import 'package:hatch_box/inspect.dart';
import 'package:hatch_box/messages.dart';
import 'package:hatch_box/prof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/search.dart';
import 'package:hatch_box/table.dart';
import 'package:hatch_box/wishlist.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final user = FirebaseAuth.instance.currentUser!;
  int sindex=0;

  void _navbar(int index){
    setState((){
      sindex = index;
    });
  }
  final List<Widget> screens =[
    HomePP(),
    Messages(),
    Wishlist(),
    Cart(),
    ProfP(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.brown,
        onTap:_navbar,
        elevation: 0,
        backgroundColor:Color.fromRGBO(220, 212, 220, 5),
        currentIndex: sindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded),label:"Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ],
      ),
      body: screens[sindex],
    );
  }
}
class HomePP extends StatefulWidget {
  const HomePP({Key? key}) : super(key: key);

  @override
  State<HomePP> createState() => _HomePPState();
}

class _HomePPState extends State<HomePP> {

  List<String> images=[
    "assets/Banner 3.jpg",
    "assets/Banner 1 .jpg",
    "assets/Banner 2 .jpg",
  ];
  List prod=[];


  @override

  Widget build(BuildContext context) {




    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(220, 212, 220, 5),
            child: Center(
              child: Stack(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                              ),
                              iconSize: 30,
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ProfP();
                                }));
                              },
                            ),
                            Text(
                              "hatchBox",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromRGBO(0, 0, 139, 1)),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.search_rounded,
                                  ),
                                  iconSize: 30,
                                  onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return Search();
                                  }));},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.logout,
                                  ),
                                  iconSize: 30,
                                  onPressed: () => FirebaseAuth.instance.signOut(),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: PageView.builder(
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 400,
                                  width: double.infinity,
                                  child: Image.asset(images[index],
                                    fit: BoxFit.cover,),
                                );
                              }),
                        ),
                      ),



                      SizedBox(height: 30,),
                      Text("Categories",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight:FontWeight.bold),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return TablePP(category: "table",);
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.table_bar_rounded,size: 35,color: Colors.brown),
                                ),

                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return TablePP(category: "furniture",);
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.chair,size: 35,color: Colors.brown,),
                                ),

                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return TablePP(category: "bed",);
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.bed_rounded,size: 35,color: Colors.brown),
                                ),

                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return TablePP(category: "electronics",);
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 80,
                                child: Center(
                                  child: Icon(Icons.electrical_services_outlined,size: 35,color: Colors.brown),
                                ),


                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("Popular Merchandise",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight:FontWeight.bold),),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width:  MediaQuery.of(context).size.width,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("home").snapshots(),
                            builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
                              if(snapshot.hasError)
                              {
                                return Text("Some Unknown Error has occured please try again");
                              }
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (_,index){
                                  DocumentSnapshot _snap=snapshot.data!.docs[index];
                                  return Product(ImgPath:_snap['image'].toString(),
                                      name:_snap['name'].toString(),
                                      discount: _snap['discount'].toString(),
                                      mrp: _snap['mrp'].toString(),
                                      your_price: _snap['your_price'].toString(),
                                      cat: _snap['category'].toString(),
                                      long_description: _snap['long_description'].toString(),
                                      status: _snap['status'].toString(),
                                     short_description: _snap['short_description'].toString(),
                                     review: _snap['rev'].toString(),
                                  );
                                },
                              );
                            }
                        ),
                      )


                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

}

// ignore: camel_case_types

class Product extends StatelessWidget {
  @override
  String ImgPath, name, cat;

  // ignore: use_key_in_widget_constructors
  Product(
      {

        // ignore: non_constant_identifier_names
        required this.ImgPath,
        required this.name,
        required this.discount,
        required this.mrp,
        required this.your_price,
        required this.cat,
        required this.long_description,
        required this.status,
        required this.short_description,
        required this.review
      });

  String mrp, discount, your_price, status, long_description,short_description,review;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Stack(children: [
        GestureDetector(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetP(ImgPath:ImgPath,name:name ,discount: discount,mrp: mrp,your_price: your_price,ls:long_description,ss: short_description,rev: review,);
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
              width: MediaQuery.of(context).size.width,
              height: 180,
              //width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    ImgPath,
                    fit: BoxFit.contain,
                    width: 200,
                    height: 95,
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView(children: [
                              Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.brown),
                              ),
                            ])),
                        Row(
                          children: [
                            Text(r"₹"),
                            Text(
                              mrp,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Text(r"₹",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),),
                                Text(
                                  your_price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
