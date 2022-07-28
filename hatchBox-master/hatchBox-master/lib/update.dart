// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatch_box/datab.dart';
import 'package:hatch_box/prof.dart';

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
        backgroundColor: Colors.red,
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
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox (height: 40),
          Text("Profile Update",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize:20 ),),
          SizedBox (height: 20),
          Container(
            padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child: Column(
              children: [
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
                /*TextField(
                  //controller: vhnoController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration (
                      labelText:"Vehicle no.",
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
                SizedBox (height: 10),*/
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
              ],
            ),
          ),
          SizedBox (height: 20),
          ElevatedButton.icon(onPressed: signUp , icon:Icon(Icons.settings, size: 20),
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Background color
              onPrimary: Colors.white, // Text Color (Foreground color)
            ),
            label: Text('Update', style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
  Future signUp() async {
    try{
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await DatabaseService(uid:user.uid).updateUserData( unameController.text, phController.text,locController.text,user.email.toString() );


    }
    on FirebaseAuthException catch (e){
      print(e.toString());
    }

  }
}
