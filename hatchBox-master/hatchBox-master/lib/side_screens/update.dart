// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/function_screens/datab.dart';
import 'package:hatch_box/side_screens/prof.dart';

class UpdateP extends StatefulWidget {
  const UpdateP({Key? key}) : super(key: key);

  @override
  State<UpdateP> createState() => _UpdatePState();
}

class _UpdatePState extends State<UpdateP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return ProfP();
          }));},
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: UpdatePP(),
    );
  }
}
class UpdatePP extends StatefulWidget {
  const UpdatePP({Key? key}) : super(key: key);

  @override
  State<UpdatePP> createState() => _UpdatePPState();
}

class _UpdatePPState extends State<UpdatePP> {
  final user =FirebaseAuth.instance.currentUser!;
  final locController = TextEditingController();
  final unameController = TextEditingController();
  final phController = TextEditingController();
  final snackBar = SnackBar(content: Text('Profile Updated'));
  String? imageurl;
  File? image;
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox (height: 40),
              Text("Profile Update",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize:20 ),),
              SizedBox (height: 20),
              Stack(alignment: Alignment.bottomRight,
                          children:[
                            Container(
                            width: 120,
                            height: 120,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                            child: Image.asset("assets/—Pngtree—cute panda_643086.png"),
                          ),
                            ElevatedButton(
                              onPressed: () {imagepicker();},
                              child: Text('+',style: TextStyle(fontSize: 20),),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                            )
                          ]
                        ),
                    TextField(
                      controller: unameController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration (
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox (height: 10),
                    TextField(
                      controller: locController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration (
                          labelText: 'Pin code',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox (height: 10),
                    TextField(
                      controller: phController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration (
                          labelText:"Phone Number",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      obscureText: true,
                    ),



              SizedBox (height: 20),
              ElevatedButton.icon(onPressed: signUpdate, icon:Icon(Icons.settings, size: 20),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),
                label: Text('Update', style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
      ),
    );
  }
  Future signUpdate() async {
    try{
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await DatabaseService(uid:user.uid).updateUserData( unameController.text, phController.text,locController.text,user.email.toString(),imageurl.toString());


    }
    on FirebaseAuthException catch (e){
      print(e.toString());
    }

  }

  Future imagepicker() async{
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 10);

        final pickedImage=File(picker!.path);
        setState(() {
          image=pickedImage;
        });
        final userid = FirebaseAuth.instance.currentUser!.uid;
        String id= userid.toString();
        print(id);
        final ref=FirebaseStorage.instance.ref().child("user-images").child("hi");
        await ref.putFile(pickedImage);
        final url=await ref.getDownloadURL();
        setState(() {
          imageurl=url;
        });


  }
}
