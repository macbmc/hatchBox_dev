import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/main_screens/cart.dart';
import 'package:hatch_box/main_screens/inspect.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key,required this.ImgPath,
    required this.name,
    required this.discount,
    required this.mrp,
    required this.your_price, required this.ls,
    required this.ss, required this.rev
  }) : super(key: key);
final String ImgPath, name,discount,mrp,your_price,ls,ss,rev;
  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {

  Future addtoOrder()async{
    var currentuser = FirebaseAuth.instance.currentUser;
    CollectionReference _collectionref = FirebaseFirestore.instance.collection("user-order");
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

    }).then((value) => print("Added to order "));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:  ElevatedButton(
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
            onPressed:(){addtoOrder();}, child: Text("Place Order",style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}
