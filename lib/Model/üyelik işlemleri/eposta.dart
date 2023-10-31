import 'package:firebase_auth/firebase_auth.dart';

// Kullanıcı girişi yapma işlemi
Future<bool> signInOrRegister(String email, String password) async {

    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,      password: password,

    );
    User? user = userCredential.user;
    if (user != null) {
      return true;
    }
    else{
      return false;
    }


}
