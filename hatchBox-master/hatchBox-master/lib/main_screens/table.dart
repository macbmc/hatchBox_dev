import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/main_screens/Home.dart';
import 'package:hatch_box/main_screens/cart.dart';
import 'package:hatch_box/side_screens/messages.dart';
import 'package:hatch_box/side_screens/prof.dart';
import 'package:hatch_box/main_screens/wishlist.dart';


class TablePP extends StatefulWidget {
  const TablePP({Key? key,required this.category}) : super(key: key);
  final String category;
  @override
  State<TablePP> createState() => _TablePPState();
}

class _TablePPState extends State<TablePP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Color.fromRGBO(220, 212, 220, 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeP();
                      }));},
                        icon:Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                        iconSize: 25,
                        color: Colors.brown,),
                      Text("Merchs",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.purple),),
                      IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Cart();
                      }));},color: Colors.brown, icon:Icon(Icons.shopping_cart,size: 25,),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*2,
                    width:  MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('home').where('category',isEqualTo:widget.category).snapshots(),
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

                ]
            ),
          )
      ),
    );
  }
}





// ignore: camel_case_types

/*
class TableProd extends StatelessWidget {
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
        required this.status});

  String mrp, discount, your_price, status, long_description;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            */
/*
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShowallDetails(
                  Img: ImgPath,
                  Name: name,
                  Discount: discount,
                  Mrp: mrp,
                  Your_price: your_price,
                  Status: status,
                  Item_Category: cat,
                  Description: long_description,
                )));*//*

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
              width: MediaQuery.of(context).size.width * .45,
              height: 180,
              //width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImgPath,
                    fit: BoxFit.fitWidth,
                    width: 160,
                    height: 100,
                  ),
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
                                    fontSize: 25,
                                    color: Colors.black),
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
                            Text(
                              your_price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
}*/
