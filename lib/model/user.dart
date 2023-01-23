import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object["id"].toString(),
      email: object["email"],
      firstName: object['first_name'],
      lastName: object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<User> getUserFromAPI(int id) async {
    String apiUrl = 'https://reqres.in/api/users/$id';

    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.createUser(userData);
  }
}

class UnintializedUser extends User {}
