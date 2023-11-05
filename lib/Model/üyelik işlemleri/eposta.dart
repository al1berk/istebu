import 'package:firebase_auth/firebase_auth.dart';
import 'package:istebu/Model/%C3%BCyelik%20i%C5%9Flemleri/local_depo.dart';

Future<bool> signInOrRegister(String email, String password) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  User? user = userCredential.user;

  if (user != null) {
    LocalData.saveUid(user.uid);

    return true;
  } else {
    return false;
  }
}

Future<String?> register(String email , String password) async {

  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    print("User registered: ${userCredential.user?.uid}");
    LocalData.saveUid(userCredential.user!.uid);
    return userCredential.user?.uid;

  } catch (e) {
    print("Error during registration: $e");
  }
}
