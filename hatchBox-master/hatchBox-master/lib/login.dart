// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
import 'package:hatch_box/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeP();
              } else {
                return LoginPP();
              }
            },
          )),
    );
  }
}

class LoginPP extends StatefulWidget {
  const LoginPP({Key? key}) : super(key: key);

  @override
  State<LoginPP> createState() => _LoginPPState();
}

class _LoginPPState extends State<LoginPP> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final snackBar = SnackBar(content: Text('Long time no see..Welcome back'));
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
            right: -30,
            child: Container(
              height: 550,
              width: MediaQuery.of(context).size.width * 1.2,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(220, 212, 211, 1),
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(250))),
            ),
          ),
          Positioned(
            right: -30,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width * 1.2,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(210, 65, 133, 1),
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(500))),
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome\nBack!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 33),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Hey! Good to see you again',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .1),
                    child: Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 33,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              //icon: Icon(Icons.mail_rounded),
                              /*fillColor: Colors.grey.shade100,
                                  filled: true,*/
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: passController,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: signIn,
                                child: Container(
                                  alignment: Alignment.center,
                                  height:
                                  MediaQuery.of(context).size.width * .13,
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                    color: Color(0xff4c505b),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Sign in',
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return MyRegister();
                                      }));
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff4c505b), fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              /*TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),*/
                            ],
                          )
                        ],
                      ),
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

  Future signIn() async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
    );
  }
}
