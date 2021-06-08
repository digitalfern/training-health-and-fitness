import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_user.dart';

class FirebaseService {

  Future<bool> editUser(String name, String email, int age) async {
    try {
      User currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        CollectionReference users =
        FirebaseFirestore.instance.collection('Users');

        QuerySnapshot _querySnapShot = await users.where("userEmail", isEqualTo: "cyy@hotmail.com").get();

        QueryDocumentSnapshot  _queryDocSnap = await _querySnapShot.docs.first;


        DocumentReference _ref = _queryDocSnap.reference;

        _ref.update({
          "name": name,
          "userEmail": email,
          "age": age
        });

        print("user edit success....");
      }
    } catch(e) {
      print(e);
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<AppUser> getUserInfoByEmail(String userEmail) async {

    AppUser _appUser = AppUser();

    try {
      if (userEmail.isNotEmpty) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('Users');

        QuerySnapshot _querySnapShot = await users.where("userEmail", isEqualTo: userEmail.trim()).get();

        QueryDocumentSnapshot  _queryDocSnap = await _querySnapShot.docs.first;

        Map _map = _queryDocSnap.data();

        _appUser = AppUser.fromJson(_map);

      }
    } catch (e) {
      print(e);
    }

    return Future.value(_appUser);
  }

}
