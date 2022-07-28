import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hatch_box/inspect.dart';
import 'package:hatch_box/prof.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/search.dart';
import 'package:hatch_box/searchget.dart';
import 'package:hatch_box/table.dart';
import 'package:hatch_box/Home.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchcontroller = TextEditingController();
  QuerySnapshot? snapshotdata;
  bool isExec = false;
  late final String ImgPath, name,discount,mrp,your_price;

  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return SizedBox(
        child: ListView.builder(
            itemCount: snapshotdata!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DetP(ImgPath:snapshotdata!.docs[index]['image'].toString(),discount:snapshotdata!.docs[index]['discount'].toString(),mrp: snapshotdata!.docs[index]['mrp'].toString(),
                      name: snapshotdata!.docs[index]['name'].toString(),your_price: snapshotdata!.docs[index]['your_price'].toString(),ls: snapshotdata!.docs[index]['ls'].toString(),ss:snapshotdata!.docs[index]['ss'].toString(),
                      rev: snapshotdata!.docs[index]['rev'].toString(),);
                  }));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshotdata!.docs[index]['image'].toString()),
                  ),
                  title: Text(snapshotdata!.docs[index]['name'].toString()),
                  subtitle: Text(snapshotdata!.docs[index]['your_price'].toString()),
                ),
              );
            }
        ),

      );

    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return HomeP();
        }));},
          icon:Icon(
            Icons.arrow_back_ios_outlined,
          ),
          iconSize: 25,
          color: Colors.white,),
        title: TextField(
          controller: searchcontroller,
          style: TextStyle(color: Color(0xff4c505b)),
          decoration: InputDecoration(

              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                iconSize: 30,
                color: Colors.white,
                onPressed: (){},
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Color(0xff4c505b)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder:(val){
              return IconButton(onPressed:(){val.queryData(searchcontroller.text).then((value){
                snapshotdata = value;
                setState(()
                {
                  isExec = true;
                });
              });
              searchData();
              },  icon: Icon(
                Icons.search_rounded,
              ),);
            } ,
          ),
        ],
      ),
      body: isExec ? searchData():
      Center(
        child: Container(
          child: Text("No Avialable searches"),
        ),
      ),
    );
  }

}
