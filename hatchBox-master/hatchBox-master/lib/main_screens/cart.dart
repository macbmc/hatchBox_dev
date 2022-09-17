import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/main_screens/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatch_box/main_screens/inspect.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  double tprice=0.0;
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                    height: MediaQuery.of(context).size.height/1.5,
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
                              if(snapshot.hasData)
                                {
                                  getData(_snap['price'].toString());
                                  return CartProd(ImgPath:_snap['image'].toString(),
                                    name:_snap['prod_name'].toString(),
                                    discount: _snap['discount'].toString(),
                                    mrp: _snap['mrp'].toString(),
                                    your_price: _snap['price'].toString(),
                                    long_description: _snap['long_description'].toString(),
                                    status: _snap['status'].toString(),
                                    short_description: _snap['short_description'].toString(),
                                    review: _snap['rev'].toString(),
                                    cat: _snap['category'].toString(),
                                    id: _snap.id,
                                  );

                                }
                              else{return Text("No items in cart",style: TextStyle(color: Colors.black),);}

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
                          Text("$tprice",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),)
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
  getData(String price)
  {
    double _tprice=0.0;
    _tprice=_tprice + double.parse('$price');

      tprice=tprice+_tprice;


  }
}
class CartProd extends StatelessWidget {
  @override
  String ImgPath, name;
  double tprice=0.0;
  // ignore: use_key_in_widget_constructors
  CartProd(
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
        required this.review,
        required this.id
      });

  String mrp, discount, your_price, status,id,long_description,short_description,review,cat;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Stack(children: [
        GestureDetector(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetP(ImgPath:ImgPath,name:name ,discount: discount,mrp: mrp,your_price: your_price,ls:long_description,ss: short_description,rev: review,status:status,cat: cat,);
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
              height: 210,
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


                               SizedBox(width: 100,),
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
                                      onPressed:(){deleteitem(id);
                                      }, child: Text("Remove",style: TextStyle(fontSize: 20),)),

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


Future deleteitem(String prodID )async{
    await FirebaseFirestore.instance.collection("user-cart").doc(FirebaseAuth.instance
        .currentUser!.email).collection("prod").doc(prodID).delete();

}
}
