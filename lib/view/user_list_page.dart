import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_sample/models/user_model.dart';
import 'package:mvvm_sample/viewmodels/cubit/user_cubit.dart';

import 'user_details_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String error = "";
  List<UserModel> users = <UserModel>[];

  @override
  void initState() {
    context.read<UserCubit>().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocConsumer<UserCubit, UserState>(
          listener: (_, state) {
            if (state is UserFailed) {
              setState(() => error = state.error);
            }
            if (state is UserLoaded) {
              users = state.users;
            }
          },
          builder: (_, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is UserFailed) {
              return Center(
                child: Text(error),
              );
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, index) {
                return ListTile(
                  onTap: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UserDetails(
                      user: users[index],
                    );
                  })),
                  title: Text(users[index].name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
