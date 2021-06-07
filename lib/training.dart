import 'package:flutter/material.dart';
import 'profile.dart';
import 'trainingabdominal.dart';
import 'trainingleg.dart';
import 'traininghand.dart';
import 'trainingback.dart';
import 'trainingbreast.dart';


class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Training'),
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

body: Container(color:Colors.black,
  child: GridView.count(
  primary: false,
  padding: const EdgeInsets.only(left:5.0,right:5.0,top:50.0,bottom:0.0),
  crossAxisSpacing: 25,
  mainAxisSpacing: 60,
  crossAxisCount: 2,
  
  children: <Widget>[
    Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/Hand.jpg'),
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
                MaterialPageRoute(builder: (context) => TrainingHand()),
              );
    },
    child:null
    ),
    ),
    Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/Back.jpg'),
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
                MaterialPageRoute(builder: (context) => TrainingBack()),
              );
    },
    child:null
    ),
    ),
    Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/Leg.jpg'),
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
                MaterialPageRoute(builder: (context) => TrainingLeg()),
              );
    },
    child:null
    ),
    ),
    Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/Abdominal.PNG'),
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
                MaterialPageRoute(builder: (context) => TrainingAbdominal()),
              );
    },
    child:null
    ),
    ),
    Container(

            decoration: new BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
                './lib/picture/breast.jpg'),
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
                MaterialPageRoute(builder: (context) => TrainingBreast()),
              );
    },
    child:null
    ),
    ),
  ]
    ),
      ),
      ),
    );

  }
}