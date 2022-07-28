import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Ar_view.dart';
import 'package:hatch_box/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/cart.dart';
import 'package:hatch_box/orders.dart';
import 'package:hatch_box/pay.dart';
import 'package:hatch_box/update.dart';
class DetP extends StatefulWidget {
  const DetP({Key? key,required this.ImgPath,
    required this.name,
    required this.discount,
    required this.mrp,
    required this.your_price, required this.ls,
    required this.ss, required this.rev
  }) : super(key: key);
  final String ImgPath, name,discount,mrp,your_price,ls,ss,rev;
  @override
  State<DetP> createState() => _DetPState();
}

class _DetPState extends State<DetP> {
  final user = FirebaseAuth.instance.currentUser!;
  Future addtoCart()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-cart");
    return _collectionref.doc(currentuser!.email).collection("prod").doc()
        .set({
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp,
      "long_description":widget.ls,
      "short_description":widget.ss,
      "rev":widget.rev

    }).then((value) => print("Added to cart "));
  }
  Future addtoWishlist()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-wishlist");
    return _collectionref.doc(currentuser!.email).collection("item").doc()
        .set({
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp,
      "long_description":widget.ls,
      "short_description":widget.ss,
      "rev":widget.rev
    }).then((value) => print("Added to wishlist"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color.fromRGBO(220, 212, 220, 5),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return HomeP();
                        }));},
                        icon:Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                        iconSize: 25,
                        color: Colors.brown,),

                      IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Cart();
                      }));}, icon: Icon(Icons.shopping_cart)),
                      IconButton(onPressed: () {addtoWishlist();}, icon: Icon(Icons.favorite_border_sharp)),
                    ],
                  ),
                  Container(
                    //color: Color.fromRGBO(220, 212, 220, 5),
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/1.1,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      widget.ImgPath,
                      fit: BoxFit.fitWidth,
                      width: 200,
                      height: 95,
                    ),
                  ),
                  SizedBox(height: 30,),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return ARViewScreen(itemImg:widget.ImgPath,);
                        }));}, child: Text("AR Experience",style: TextStyle(fontSize: 20),)),
                  Container(
                    padding: EdgeInsets.only(top: 25.0,right: 20.0,left: 15.0),
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //color: Color.fromRGBO(220, 212, 220, 5),
                      //borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.ss}",style: TextStyle(fontSize:20),),
                        SizedBox(
                          height: 20,
                        ),
                        //Text("Rs ${widget.your_price}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text(r"₹"),
                            Text(
                              "${widget.mrp}",
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
                                    fontWeight: FontWeight.bold, fontSize: 23),),
                                Text(
                                  "${widget.your_price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 23,color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25.0,right: 20.0,left: 15.0),
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height/3.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //color: Color.fromRGBO(220, 212, 220, 5),
                        //borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                        borderRadius: BorderRadius.all(Radius.circular(40.0))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Details",style: TextStyle(fontSize:15,color: Colors.purple),),
                        SizedBox(
                          height: 15,
                        ),
                        Text("${widget.ls}")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25.0,right: 20.0,left: 15.0),
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //color: Color.fromRGBO(220, 212, 220, 5),
                        //borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                        borderRadius: BorderRadius.all(Radius.circular(40.0))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Review",style: TextStyle(fontSize:15,color: Colors.purple),),
                        SizedBox(
                          height: 15,
                        ),
                        Text("${widget.rev}")
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height/9.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            onPressed: (){
                              addtoCart();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                           return Cart();
                          }));},
                    child: Text("Checkout",style: TextStyle(fontSize: 20),)),
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
                            onPressed:(){addtoCart();
                              }, child: Text("Add to Cart",style: TextStyle(fontSize: 20),)),
                      ],
                    ),
                  )


                ],
              ),
            )
        )
    );
  }
}

/*
Container(
padding: EdgeInsets.all(8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text("Rs24.5",style: TextStyle(fontSize: 20),),
ElevatedButton(onPressed:(){}, child: Text("Checkout")),
ElevatedButton(onPressed:(){}, child: Icon(Icons.shopping_cart)),

],
),
),*/
