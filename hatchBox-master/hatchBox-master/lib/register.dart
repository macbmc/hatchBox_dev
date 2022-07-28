import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/datab.dart';
import 'package:hatch_box/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            /*appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),*/
            body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HomeP();
                } else {
                  return SignPP();
                }
              },
            )),
      ),
    );
  }
}

class SignPP extends StatefulWidget {
  const SignPP({Key? key}) : super(key: key);

  @override
  State<SignPP> createState() => _SignPPState();
}

class _SignPPState extends State<SignPP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final unameController = TextEditingController();
  final phController = TextEditingController();
  final snackBar = SnackBar(content: Text('Welcome to Hatchbox Community'));
  final snackBar1 = SnackBar(content: Text('Please Enter Valid Info'));
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: 00,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 212, 211, 1),
                ),
              )),
          Positioned(
            top: 175,
            left: -150,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(500))),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * 1.5,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(210, 65, 133, 1),
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(550)),
                ),
              )),
          Container(
            padding: EdgeInsets.only(left: 35, top: 30),
            child: Text(
              'Sign up',
              style: TextStyle(
                  color: Color(0xff4c505b),
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          key: _formKey,
                          controller: unameController,
                          /*validator: (value){
                            if(value!.length<4){
                              return "Enter crct value";
                            }
                            else{return null;}
                          },
                          onChanged: (value){
                            setState((){unameController = value})
                          },*/
                          style: TextStyle(color: Color(0xff4c505b)),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xff4c505b),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(color: Color(0xff4c505b)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: emailController,
                          style: TextStyle(color: Color(0xff4c505b)),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xff4c505b),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Color(0xff4c505b)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: phController,
                          style: TextStyle(color: Color(0xff4c505b)),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xff4c505b),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Phone No",
                              hintStyle: TextStyle(color: Color(0xff4c505b)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: passController,
                          style: TextStyle(color: Color(0xff4c505b)),
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xff4c505b),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Color(0xff4c505b)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:signUp,
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                MediaQuery.of(context).size.width * .13,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                  color: Color(0xff4c505b),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MyLogin();
                                }));
                              },
                              child: Text(
                                'Sign In',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              style: ButtonStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signUp() async {
      try {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        UserCredential result =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        User? user = result.user;
        await DatabaseService(uid:user!.uid).updateUserData( unameController.text, phController.text,"222",emailController.text );
      } on FirebaseAuthException catch (e) {
        print(e.toString());
      }
  }

  /*void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }*/
}
