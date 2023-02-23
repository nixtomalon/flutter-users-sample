import 'package:flutter/material.dart';
import 'package:mvvm_sample/models/user_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                child: Image.network(
                  user.imageUrl,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            SizedBox(height: 28),
            Text(
              'ID: ${user.id}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 28),
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
