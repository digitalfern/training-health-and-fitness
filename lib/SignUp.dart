import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_and_diet/userdata.dart';
import 'homepage.dart';

class SignUp extends StatefulWidget {
  
  @override
  _SignUpState createState() => _SignUpState();
  String displayname;
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkAuthetication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    });
  }

 

  @override
  void initState() {
    super.initState();
    this.checkAuthetication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
          userSetup(_name,_email);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,

        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
        ),
        ),

        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: Image(
              image: AssetImage('./lib/picture/Login.jpg'),
            ),
          ),
          Container(
              child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter Name';
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                      onSaved: (input) => _name = input),
                ),
                Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) return 'Enter Email';
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (input) => _email = input),
                ),
                Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input.length < 6)
                          return 'Please provide MINIMUM 6 character';
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.email),
                      ),
                      obscureText: true,
                      onSaved: (input) => _password = input),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: signUp,
                  child: Text('Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    ),
      ),
    );
  }
}