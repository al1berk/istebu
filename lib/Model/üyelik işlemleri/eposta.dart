import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signInOrRegister(String email, String password) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  User? user = userCredential.user;
  if (user != null) {
    return true;
  } else {
    return false;
  }
}

Future<void> _register(String email , String password) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User registered: ${userCredential.user?.uid}");
  } catch (e) {
    print("Error during registration: $e");
  }
}
