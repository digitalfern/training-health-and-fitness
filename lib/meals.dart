import 'package:flutter/material.dart';
import 'profile.dart';
import 'healthyfood1.dart';
import 'healthyfood2.dart';
import 'healthyfood3.dart';
import 'healthyfood4.dart';

class Meals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        centerTitle: true,

        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
        ),

        actions: <Widget>[
        IconButton(
        icon: Icon(Icons.account_box_rounded, color: Colors.white),
    onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
    },
        ),
        ],
        ),

        body: Container(
        child: new ListView(
          children: [Container(
            height: 200.0,
            width: 350.0,
            margin: EdgeInsets.only(left:20.0,right:20.0,top:30.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/healthyfood1.jpg'),
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
                MaterialPageRoute(builder: (context) => Healthyfood1()),
              );
    },
    child:null
    ),
    ),
            Container(
            height: 200.0,
            width: 350.0,
            margin: EdgeInsets.only(left:20.0,right:20.0,top:30.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/healthyfood1.jpg'),
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
                MaterialPageRoute(builder: (context) => Healthyfood2()),
              );
    },
    child:null
    ),
    ),Container(
            height: 200.0,
            width: 350.0,
            margin: EdgeInsets.only(left:20.0,right:20.0,top:30.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/healthyfood1.jpg'),
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
                MaterialPageRoute(builder: (context) => Healthyfood3()),
              );
    },
    child:null
    ),
    ),Container(
            height: 200.0,
            width: 350.0,
            margin: EdgeInsets.only(left:20.0,right:20.0,top:30.0),
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/healthyfood1.jpg'),
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
                MaterialPageRoute(builder: (context) => Healthyfood4()),
              );
    },
    child:null
    ),
    ),
          ],
          
        ),
      ),
      ),
    );
  }
}