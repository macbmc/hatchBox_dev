import 'package:flutter/material.dart';
import 'package:hatch_box/Ar_view.dart';

class showdetails extends StatelessWidget {
  const showdetails(
      {Key? key,
      required this.Img,
      required this.Name,
      required this.Discount,
      required this.Mrp,
      required this.Your_price,
      required this.Status,
      required this.Item_Category,
      required this.Description})
      : super(key: key);

  final String Img,
      Name,
      Discount,
      Mrp,
      Status,
      Your_price,
      Item_Category,
      Description;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    color: Colors.pink,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                        child: Text(
                      Name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    Img,
                    fit: BoxFit.fill,
                  ),
                ),
                Divider(
                  color: Colors.black38,
                  thickness: 20,
                ),
                RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      "AR-View",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ARViewScreen(
                                itemImg : Img
                              )));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
