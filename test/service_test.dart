import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_sample/models/user_model.dart';
import 'package:mvvm_sample/services/user_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('UserService', () {
    late UserSerivce userService;

    setUp(() {
      userService = UserSerivce();
    });

    test('getUsers returns a list of users on success', () async {
      final url = Uri.parse(userService.url);

      final response = await http.get(url);

      expect(response.statusCode, 200);

      final List<dynamic> datas = jsonDecode(response.body);
      final List<UserModel> users =
          datas.map((e) => UserModel.fromJson(e)).toList();

      expect(users.isNotEmpty, true);

      users.forEach((user) {
        expect(user.id, isNotNull);
        expect(user.name, isNotNull);
        expect(user.imageUrl, isNotNull);
      });
    });
  });
}
