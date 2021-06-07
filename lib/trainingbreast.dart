import 'package:flutter/material.dart';
import 'profile.dart';

class TrainingBreast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Breast'),
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
      ),
    );
  }
}