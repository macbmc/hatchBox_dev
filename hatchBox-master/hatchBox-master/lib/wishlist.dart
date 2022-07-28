import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/inspect.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
                    Text("Wishlist",style: TextStyle(fontSize: 20,color: Colors.amber,fontWeight: FontWeight.bold),)
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
                    height: MediaQuery.of(context).size.height*2,
                    width:  MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream:FirebaseFirestore.instance.collection("user-wishlist").doc(FirebaseAuth.instance
                          .currentUser!.email).collection("item").snapshots(),
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
