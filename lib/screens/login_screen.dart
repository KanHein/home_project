// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gold/screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth? _auth;
  GoogleSignIn? _googleSignIn;

  Future<bool> signInWithGoogle() async {
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn!.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth!.signInWithCredential(credential);
      return true;
    }catch(e){
      return false;
    }
  }

  void initialize() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              direction: ShimmerDirection.ttb,
              child: const Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 100,
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.green,
            highlightColor: Colors.yellow,
            child: const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () async {
              bool isAuth = await signInWithGoogle();
              if(isAuth){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Home()),
                        (Route<dynamic> route) => false);
              }
            },
            child: const Text("Login with Google"),
          ),
        ],
      ),
    );
  }
}
