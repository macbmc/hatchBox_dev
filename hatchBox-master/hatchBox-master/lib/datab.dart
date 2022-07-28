import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future updateUserData(String name,String phoneno,String pin,String emaill) async{
    return await userCollection.doc(uid).set({
      'name': name,
      'email':emaill,
      'phoneno':phoneno,
      'pincode':pin,

    });
  }

  Future getData() async{
    final DocumentSnapshot userDoc =await FirebaseFirestore.instance.collection("users").doc(uid).get();
    String _name= userDoc.get("name");
    String phno= userDoc.get("phoneno");
    String loc= userDoc.get("location");
    String vno= userDoc.get("vehicleno");
    return _name;
    print(_name);
    print(vno);
  }

}
