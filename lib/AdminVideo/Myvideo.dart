import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'deleteArm.dart';
import 'deleteBack.dart';
import 'deleteChest.dart';
import 'deleteLeg.dart';
import '../user/profile.dart';
import 'deleteAbdominal.dart';

class MyVideo extends StatefulWidget {
  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {

  final fb = FirebaseDatabase.instance.reference().child("VideoLink");
  List<String> itemList=new List ();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyVideo'),
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

      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left:40.0,right:40.0,top:40.0), 
          children: <Widget>[
              RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      onPressed: uploadToStorage,
                      child: Text('Upload Abdominal Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.green,
                    ),

SizedBox(height: 10,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteAbdominal()),
                );
              },
                      child: Text('Delete Abdominal Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.green,
                    ),

SizedBox(height: 25,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      onPressed: uploadToStorage2,
                      child: Text('Upload Training Back Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.blue,
                    ),

                    SizedBox(height: 10,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteTrainingBack()),
                );
              },
                      child: Text('Delete Training Back Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.blue,
                    ),

SizedBox(height: 25,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      onPressed: uploadToStorage3,
                      child: Text('Upload Training Chest Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                    ),

                    SizedBox(height: 10,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteTrainingChest()),
                );
              },
                      child: Text('Delete Training Chest Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                    ),

SizedBox(height: 25,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      onPressed: uploadToStorage4,
                      child: Text('Upload Training Arm Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.purple,
                    ),

                    SizedBox(height: 10,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteTrainingArm()),
                );
              },
                      child: Text('Delete Training Arm Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.purple,
                    ),

SizedBox(height: 25,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                      onPressed: uploadToStorage5,
                      child: Text('Upload Training Leg Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(                            
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.black,
                    ),

                    SizedBox(height: 10,),

RaisedButton(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteTrainingLeg()),
                );
              },
                      child: Text('Delete Training Leg Video',
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.black,
                    ),

          ],
        ),
        
      ),
      
    );
  }
  
  Future uploadToStorage() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    final _picker = ImagePicker();    

    try {
      mAuth.signInAnonymously().then((value)  async {
        PickedFile file = await _picker.getVideo(source: ImageSource.gallery);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("videoAbdominal").child(id);
        var imageFile = File(file.path);
                firebase_storage.UploadTask uploadTask = ref.putFile(imageFile ,firebase_storage.SettableMetadata(contentType: 'video/mp4'));
        var storageTaskSnapshot = await uploadTask;
        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        final String url = downloadUrl.toString();
        fb.child(id).set({
          "id": id,
          "link": url,
        }).then((value) {
          print("Done");
        });
      });
    } catch (error) {
      print(error);
    }
  }

  Future uploadToStorage2() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    final _picker = ImagePicker();
    try {
      mAuth.signInAnonymously().then((value)  async {
        PickedFile file = await _picker.getVideo(source: ImageSource.gallery);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("videoBack").child(id);
        var imageFile = File(file.path);
                firebase_storage.UploadTask uploadTask = ref.putFile(imageFile ,firebase_storage.SettableMetadata(contentType: 'video/mp4'));
        var storageTaskSnapshot = await uploadTask;
        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        final String url = downloadUrl.toString();
        fb.child(id).set({
          'id': id,
          'link': url,
        }).then((value) {
          print("Done");
        });
      });
    } catch (error) {
      print(error);
    }
  }

  Future uploadToStorage3() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    final _picker = ImagePicker();    

    try {
      mAuth.signInAnonymously().then((value)  async {
        PickedFile file = await _picker.getVideo(source: ImageSource.gallery);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("videoChest").child(id);
        var imageFile = File(file.path);
                firebase_storage.UploadTask uploadTask = ref.putFile(imageFile ,firebase_storage.SettableMetadata(contentType: 'video/mp4'));
        var storageTaskSnapshot = await uploadTask;
        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        final String url = downloadUrl.toString();
        fb.child(id).set({
          "id": id,
          "link": url,
        }).then((value) {
          print("Done");
        });
      });
    } catch (error) {
      print(error);
    }
  }

  Future uploadToStorage4() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    final _picker = ImagePicker();    

    try {
      mAuth.signInAnonymously().then((value)  async {
        PickedFile file = await _picker.getVideo(source: ImageSource.gallery);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("videoArm").child(id);
        var imageFile = File(file.path);
                firebase_storage.UploadTask uploadTask = ref.putFile(imageFile ,firebase_storage.SettableMetadata(contentType: 'video/mp4'));
        var storageTaskSnapshot = await uploadTask;
        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        final String url = downloadUrl.toString();
        fb.child(id).set({
          "id": id,
          "link": url,
        }).then((value) {
          print("Done");
        });
      });
    } catch (error) {
      print(error);
    }
  }

  Future uploadToStorage5() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    final _picker = ImagePicker();    

    try {
      mAuth.signInAnonymously().then((value)  async {
        PickedFile file = await _picker.getVideo(source: ImageSource.gallery);
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("videoLeg").child(id);
        var imageFile = File(file.path);
                firebase_storage.UploadTask uploadTask = ref.putFile(imageFile ,firebase_storage.SettableMetadata(contentType: 'video/mp4'));
        var storageTaskSnapshot = await uploadTask;
        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        final String url = downloadUrl.toString();
        fb.child(id).set({
          "id": id,
          "link": url,
        }).then((value) {
          print("Done");
        });
      });
    } catch (error) {
      print(error);
    }
  }
}
