import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/inspect.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeP();
                      }));},
                      icon:Icon(
                        Icons.arrow_back_ios_outlined,color: Colors.black,
                      ),
                      iconSize: 25,
                      color: Colors.brown,),
                     Text("Cart",style: TextStyle(fontSize: 20,color: Colors.amber,fontWeight: FontWeight.bold),)
                    ,IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/1.6,
                    width:  MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream:FirebaseFirestore.instance.collection("user-cart").doc(FirebaseAuth.instance
                          .currentUser!.email).collection("prod").snapshots(),
                      builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
                        if(snapshot.hasError)
                        {
                          return Center(child: Text("Ntho Evdyo oru Prashnm"),);
                        }
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (_,index){
                              DocumentSnapshot _snap= snapshot.data!.docs[index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return DetP(ImgPath:_snap['image'].toString(),discount:_snap['discount'].toString(),mrp: _snap['mrp'].toString(),
                                      name: _snap['prod_name'].toString(),your_price: _snap['price'].toString(),ls: _snap['long_description'].toString(),ss:_snap['short_description'].toString(),
                                      rev: _snap['rev'].toString());
                                  }));
                                },
                                child: SizedBox(
                                  height: 80,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          _snap['image'].toString()),
                                    ),
                                    trailing: Text(_snap["mrp"].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                                    title: Text(_snap["prod_name"].toString()),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height/9.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total:",style: TextStyle(fontSize: 20),),
                          Text("Rs.555.2",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),)
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all(Colors.brown),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          onPressed:(){
                          }, child: Text("Proceed to Payment",style: TextStyle(fontSize: 20),)),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

}
