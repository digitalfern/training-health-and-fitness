import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_and_diet/UI/homepage.dart';
import '../calling/firebase_service.dart';
import '../calling/app_user.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseService _firebaseService = FirebaseService();
  User user;
  String imageUrl;
  int index = 0;

  AppUser _appUser = AppUser();

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();

    initData();
  }

  void refreshData() {
    initData();
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => EditProfile());
    Navigator.push(context, route).then(onGoBack);
  }

  Future initData() async {
    try {
      User currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        //todo edit user by passing user information.
        // await _firebaseService.editUser("Cyy", "cyy@hotmail.com", 30);

        //todo you can pass user email. ex:- currentUser.email
        _appUser = await _firebaseService.getUserInfoByEmail(currentUser.email);

        print("user name  is ${_appUser.username}");
        print("image url id ${_appUser.imageUrl}");

        setState(() {});
      }

      print("currentUser ${currentUser.email}");
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, color: Colors.black),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.account_box_rounded, color: Colors.black),
            ),
            BottomNavigationBarItem(
              label: 'Sign Out',
              icon: Icon(Icons.logout, color: Colors.black),
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            } else if (index == 2) {
              signOut();
            }
          },
        ),
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
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    (_appUser.imageUrl != null)
                        ? Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_appUser.imageUrl),
                                )),
                          )
                        // Image.network(_appUser.imageUrl)
                        : Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      './lib/picture/nullProfilePic.jpg'),
                                )),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("User Name", _appUser.username),
              buildTextField("E-mail", _appUser.email),
              buildTextField("Age", "${_appUser.age}"),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                      onPressed: () {
                        navigateSecondPage();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => EditProfile()),
                        // );
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
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 30.0, bottom: 0.0),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./lib/picture/needsomehelp.PNG'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
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

  Widget buildTextField(String labelText, String placeholder) {
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
}
