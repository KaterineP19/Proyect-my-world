import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_world/SitiosInteres.dart';
import 'package:my_world/models/User.dart' as UserApp;

class firebase_api{

  Future<String?> registrarUser (String correo, String contrasena) async {
    try{
      final credential = await
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: correo, password: contrasena);
      return credential.user?.uid;
    } on FirebaseAuthException catch(e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e){
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future <String?> loginUser (String correo, String contrasena) async {
    try {
      final credential = await
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: correo, password: contrasena);
      return credential.user?.uid;
    } on FirebaseAuthException catch(e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e){
      print("FirebaseException ${e.code}");
      return e.code;
    }
    }

  Future<String> createUser(UserApp.User user) async {
    try{
      final documento = await FirebaseFirestore.instance.collection("users").doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
  }
