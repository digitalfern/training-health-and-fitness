import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training_and_diet/calling/app_user.dart';
import 'package:training_and_diet/calling/firebase_service.dart';

String email, result;

class ResultScreen extends StatefulWidget {
  String result2;
  String msg;
  String des;
  ResultScreen(this.result2, this.msg, this.des);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseService _firebaseService = FirebaseService();

  AppUser _appUser = AppUser();

  void saveData() async {
    email = _appUser.email;
    result = widget.result2;
    User currentUser = FirebaseAuth.instance.currentUser;
    await _firebaseService.updateBmi("${currentUser.email}", double.parse(result));
    print("Email===>>>> ${currentUser.email}");
    print("result===>>> ${double.parse(result)}");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.result2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.des,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  onPressed: () {
                    saveData();
                  },
                  child: Text('Save Result',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              color: Colors.orange,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Recalculate",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
