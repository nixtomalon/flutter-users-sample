import 'dart:convert';

import 'package:mvvm_sample/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserSerivce {
  final String url =
      "https://gist.githubusercontent.com/dustincatap/66d48847b3ca07af7cef789d6ac8fee8/raw/550798be0efa8b98f6924cfb4ad812cd290f568a/users.json";

  Future<List<UserModel>> getUser() async {
    List<UserModel> users = <UserModel>[];
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var d in data) {
          users.add(UserModel.fromJson(d));
        }
      }
    } catch (e) {
      print(e);
    }
    return users;
  }
}
