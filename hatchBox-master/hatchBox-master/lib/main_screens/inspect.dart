import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/function_screens/prodtable.dart';
import 'package:hatch_box/main_screens/Ar_view.dart';
import 'package:hatch_box/main_screens/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/main_screens/cart.dart';
import 'package:hatch_box/main_screens/orders.dart';
import 'package:hatch_box/side_screens/pay.dart';
import 'package:hatch_box/side_screens/update.dart';
class DetP extends StatefulWidget {
  const DetP({Key? key,required this.ImgPath,
    required this.name,
    required this.discount,
    required this.mrp,
    required this.your_price, required this.ls,required this.cat,
    required this.ss, required this.rev,required this.status
  }) : super(key: key);
  final String ImgPath, name,discount,mrp,your_price,ls,ss,rev,status,cat;
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
      "category":widget.cat,
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp,
      "long_description":widget.ls,
      "short_description":widget.ss,
      "rev":widget.rev,
      "status":widget.status
    }).then((value) => print("Added to cart "));
  }
  Future addtoWishlist()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-wishlist");
    return _collectionref.doc(currentuser!.email).collection("item").doc()
        .set({
      "category":widget.cat,
      "prod_name":widget.name,
      "price":widget.your_price,
      "image":widget.ImgPath,
      "discount":widget.discount,
      "mrp":widget.mrp,
      "long_description":widget.ls,
      "short_description":widget.ss,
      "rev":widget.rev,
      "status":widget.status
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
                        Text("${widget.name}",style: TextStyle(fontSize:20),),
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "- ${widget.discount}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 18,color: Colors.red),
                                    ),
                                    Text(
                                      "%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 18,color: Colors.red),
                                    ),
                                  ],
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
                    height: MediaQuery.of(context).size.height/2.5,
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
                        Text("Product Details",style: TextStyle(fontSize:18,color: Colors.purple),),
                        SizedBox(
                          height: 15,
                        ),
                        Text("${widget.ls}")
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return HomeP();
            }));},
                        child: Container(
                          //padding: EdgeInsets.only(top: 20.0,right: 20.0,left: 15.0),
                          margin: EdgeInsets.all(10.0),
                          height:60,
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //color: Color.fromRGBO(220, 212, 220, 5),
                              //borderRadius:  BorderRadius.only(topRight: Radius.circular(40)),
                              borderRadius: BorderRadius.all(Radius.circular(40.0))
                          ),
                          child: Center(child: Text("Reviews",style: TextStyle(fontSize:20,color: Colors.red),)),
                              //sText("${widget.rev}"

                        ),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return ARViewScreen(itemImg:widget.ImgPath,);
                            }));}, child: Text("AR Experience",style: TextStyle(fontSize: 20),)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Related Products:",style: TextStyle(fontSize:20,color: Colors.purple),),
                        GestureDetector(child: Text("more",style: TextStyle(fontSize:15,color: Colors.red),)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/4,
                    width:  MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('home').where('category',isEqualTo:widget.cat).snapshots(),
                        builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
                          if(snapshot.hasError)
                          {
                            return Text("Some Unknown Error has occured please try again");
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (_,index){
                              DocumentSnapshot _snap=snapshot.data!.docs[index];
                              return TableProd(
                                Img:_snap['image'].toString(),
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
                    child: Text("Buy Now",style: TextStyle(fontSize: 20),)),
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
