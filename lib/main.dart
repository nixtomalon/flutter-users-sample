import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_sample/services/user_service.dart';
import 'package:mvvm_sample/view/user_list_page.dart';
import 'package:mvvm_sample/viewmodels/cubit/user_cubit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => UserCubit(service: UserSerivce()),
        child: UsersPage(),
      ),
    );
  }
}
