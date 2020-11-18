import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.createUser(Map<String, dynamic> object) {
    User user = User(
      id: object["id"].toString(),
      email: object["email"],
      firstName: object["first_name"],
      lastName: object["last_name"],
      avatar: object["avatar"],
    );

    return user;
  }

  static Future<User> getUserFromAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = jsonObject["data"];

    return User.createUser(userData);
  }
}

class UninitializedUser extends User {}
