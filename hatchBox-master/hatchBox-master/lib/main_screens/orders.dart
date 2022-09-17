import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/main_screens/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/main_screens/inspect.dart';
import 'package:hatch_box/side_screens/prof.dart';


class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProfP();
                      }));},
                      icon:Icon(
                        Icons.arrow_back_ios_outlined,color: Colors.black,
                      ),
                      iconSize: 25,
                      color: Colors.brown,),
                    Text("ORDERS",style: TextStyle(fontSize: 25,color: Colors.amber,fontWeight: FontWeight.bold),)
                    ,IconButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return HomeP();
      }));},icon: Icon(Icons.home)),
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
                    height: MediaQuery.of(context).size.height*2,
                    width:  MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream:FirebaseFirestore.instance.collection("user-order").doc(FirebaseAuth.instance
                          .currentUser!.email).collection("prod").snapshots(),
                      builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
                        if(snapshot.hasData)
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
                                        rev: _snap['rev'].toString(),status:_snap['status'].toString(),cat:_snap['category'].toString(),);
                                  }));
                                },
                                child: SizedBox(
                                  height: 80,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          _snap['image'].toString()),
                                    ),
                                    trailing: Text(_snap["mrp"].toString()),
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
              ],
            ),
          )
      ),
    );



  }


}
