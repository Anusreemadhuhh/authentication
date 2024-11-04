import 'package:authentication/Authentication/Google_Auth/Googlelogin.dart';
import 'package:authentication/Authentication/Google_Auth/Homepage.dart';
import 'package:authentication/Authentication/Google_Auth/Profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Crudauth extends StatefulWidget {
  const Crudauth({super.key});

  @override
  State<Crudauth> createState() => _CrudauthState();
}

class _CrudauthState extends State<Crudauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return homepage();
            }
            //user is notlogged in
            else {
              return Google_login();
            }
          }),
    );
  }
}