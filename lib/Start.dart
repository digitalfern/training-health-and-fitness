import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:training_and_diet/Login.dart';
import 'SignUp.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Start extends StatefulWidget{
  @override
  _StartState createState() => _StartState();
}


class _StartState extends State<Start>{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {

    GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount googleUser = await googleSignIn.signIn();

    if (googleUser != null) {

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;



      if (googleAuth.idToken != null && googleAuth.accessToken != null) {

        final AuthCredential credential = GoogleAuthProvider.credential(

            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);



        final UserCredential user =

            await _auth.signInWithCredential(credential);



        await Navigator.pushReplacementNamed(context, "/");



        return user;

      } else {

        throw StateError('Missing Google Auth Token');

      }

    } else

      throw StateError('Sign in Aborted');

  }
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 45.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage('./lib/picture/register.jpeg'),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            RichText(
                text: TextSpan(
                    text: 'Welcome to  ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'HealthyLux',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange))
                ])),
            SizedBox(height: 10.0),
            Text(
              'A Training & Diet App',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 12.0),
            Text(
              'Your body hears everything that your mind says',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 25.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToLogin,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.orange),
              SizedBox(width: 20.0),
              RaisedButton(
                  onPressed: navigateToSignUp,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.orange),
            ]),
            SizedBox(height: 20.0),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: googleSignIn
            ),
          ],
        ),
      ),
    );
  }
}