import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {

final FirebaseAuth _auth = FirebaseAuth.instance;

  User user;
  String imageUrl;

     signOut() async {
     _auth.signOut();
   }
   

  @override
  void initState() {
  super.initState();
 }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,

        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: <Widget>[

            RaisedButton(
                      padding: EdgeInsets.fromLTRB(300, 10, 0, 10),
                      onPressed: signOut,
                      child: Text('SIGN OUT',
                          style: TextStyle(
                              color: Colors.orange.shade400,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),

SizedBox(height: 15,),

              Center(
                child: Stack(
                    children: <Widget>[
          (imageUrl != null)
            ? Image.network(imageUrl)
            : Placeholder(fallbackHeight: 200.0,fallbackWidth: double.infinity),
          SizedBox(height: 20.0,),
          RaisedButton(  
            child: Text('Upload Image'),
            color: Colors.lightBlue,
            onPressed: () => uploadImage(),
          )
        ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
            

              buildTextField("User Name", "Cyy"),
              buildTextField("E-mail", "Cyy@hotmail.com"),
              buildTextField("Age", "21"),
              SizedBox(
                height: 25,
              ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,

              children: [Center(
                child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                        onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
    },
                        child: Text('Edit Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
              ),
            ],
            ),

           Container(
      width: 450,
      height: 300,
      margin: EdgeInsets.only(left:15.0,right:15.0,top:30.0,bottom:0.0),
              decoration: new BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          './lib/picture/needsomehelp.PNG'),
        fit: BoxFit.fill,
        ),
       borderRadius:
            BorderRadius.circular(20.0),        
    ),
           ),

           RaisedButton(
                      padding: EdgeInsets.fromLTRB(240, 0, 30, 0),
                      onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
    },
                      child: Text('Need some help..',
                          style: TextStyle(
                              color: Colors.blue.shade200,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                              color: Theme.of(context).scaffoldBackgroundColor),

          ],
      ),
      
    ),
      ),
    );

  

}
 Widget buildTextField(
      String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
      }

         uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

      await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
        .child('folderName/imageName')
        .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }
   }

   
}