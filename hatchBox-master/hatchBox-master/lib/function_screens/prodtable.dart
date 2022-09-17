import 'package:flutter/material.dart';
import 'package:hatch_box/main_screens/inspect.dart';
class TableProd extends StatelessWidget {
  @override
  String Img, name, cat;

  // ignore: use_key_in_widget_constructors
  TableProd(
      {

        // ignore: non_constant_identifier_names
        required this.Img,
        required this.name,
        required this.discount,
        required this.mrp,
        required this.your_price,
        required this.cat,
        required this.long_description,
        required this.status,
        required this.short_description,
        required this.review,});

  String mrp, discount, your_price, status, long_description,short_description,review;

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
    child: Stack(children: [
    GestureDetector(
    onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetP(ImgPath:Img,name:name ,discount: discount,mrp: mrp,your_price: your_price,ls:long_description,ss: short_description,rev: review,status:status,cat: cat,)));

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
                  Image.network(
                    Img,
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
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ])),
                       /* Row(
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
                        ),*/
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