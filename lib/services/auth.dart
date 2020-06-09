import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notas/models/user.dart';
import 'package:notas/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  User _userFormFBUser(FirebaseUser fbu) {
    return fbu != null ? User(uid: fbu.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFormFBUser);
  }

  //SingIn anonimo
  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Singout
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Registro con mail y clave
  Future registerWithUserAndPassword(String email, String pwd) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      
      await DatabaseService(uid: result.user.uid, mail: email).crearDatosIniciales();
      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sing In con mail y clave
  Future singInWithUserAndPassword(String email, String pwd) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pwd);

      DatabaseService db = DatabaseService(uid: result.user.uid, mail: email);
      dynamic data = await db.getData();
      
      if (data.data == null) {
        await db.crearDatosIniciales();
      }

      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //--- login con google
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount gsa = await _googleSignIn.signIn();
      final GoogleSignInAuthentication gAuth = await gsa.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: gAuth.idToken, accessToken: gAuth.accessToken);
      
      AuthResult result = await _auth.signInWithCredential(credential);

      DatabaseService db = DatabaseService(uid: result.user.uid, mail: gsa.email);
      dynamic data = await db.getData();
      
      if (data.data == null) {
        await db.crearDatosIniciales();
      }

      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //--- logout google
  void signOutGoogle() async{}
 }