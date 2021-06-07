import 'package:flutter/material.dart';
import 'Myvideo.dart';
import 'profile.dart';
import 'training.dart';
import 'meals.dart';
import 'bmi.dart';
import 'Start.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()));
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text('Training and Diet'),
        centerTitle: true,

        actions: <Widget>[
        IconButton(
        icon: Icon(Icons.account_box_rounded, color: Colors.white),
    onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyVideo()),
              );
    },
        ),
        ],
        ),

  body: Container(
    width: 450,
    height:760,
    color:Colors.black,
    
    child: Stack(
    children: <Widget>[
      Container(
        height: 250.0,
        width: 400.0,
        margin: EdgeInsets.only(left:15.0,right:15.0,top:40.0),

    decoration: new BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          './lib/picture/healthy.jpg'),
        fit: BoxFit.fill,
        ),
       borderRadius:
            BorderRadius.circular(20.0),        
    ),
    // ignore: deprecated_member_use
    child: FlatButton(
      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Meals()),
              );
    },
    child:null
    ),
    ),
    
        Positioned(
          bottom: 0,
          left: 0,
      

    child: Container(
      width: 180,
      height: 310,
      margin: EdgeInsets.only(left:15.0,right:15.0,top:30.0,bottom:65.0),
      
      decoration: new BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          './lib/picture/depositphotos_82158134-stock-photo-athletic-man-and-woman-with.jpg'),
        fit: BoxFit.fill,
        ),
       borderRadius:
            BorderRadius.circular(20.0),        
    ),
    // ignore: deprecated_member_use
    child: FlatButton(
      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Training()),
              );
    },
    child:null
    ),
    ),
    ),
    
Positioned(
          bottom: 0,
          right: 0,
      

    child: Container(
      width: 180,
      height: 323,
      margin: EdgeInsets.only(left:15.0,right:15.0,top:30.0,bottom:65.0),
      
      decoration: new BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          './lib/picture/unnamed.png'),
        fit: BoxFit.fill,
        ),
       borderRadius:
            BorderRadius.circular(20.0),        
    ),
    // ignore: deprecated_member_use
    child: FlatButton(
      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bmi()),
              );
    },
    child:null
    ),
    ),
    ),

    ],
    ),
    ),
    ),
    );
  }
}