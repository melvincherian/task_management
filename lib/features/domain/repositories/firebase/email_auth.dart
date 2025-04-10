import 'package:firebase_auth/firebase_auth.dart';

class Authservices{
  final _auth=FirebaseAuth.instance;

  Future<void>sendPasswordResetEmail(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);

    }catch(e){
      print(e.toString());
    }
  }
}