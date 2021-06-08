/// name : ""
/// email : ""
/// username : ""

class AppUser {
  String _name = "";
  String _email = "";
  String _username = "";
  int _age = 0;

  String get name => _name;
  String get email => _email;
  String get username => _username;
  int get age => _age;

  AppUser({
      String name, 
      String email, 
      String username,
      int age
  }){
    _name = name;
    _email = email;
    _username = username;
    _age = age;
}

  AppUser.fromJson(dynamic json) {
    _name = json["name"] ?? "";
    _email = json["userEmail"] ?? "";
    _username = json["userName"] ?? "";
    _age = json["age"] ?? 0;

    print("json is $json");
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["userEmail"] = _email;
    map["userName"] = _username;
    map["age"] = _age;
    return map;
  }

}