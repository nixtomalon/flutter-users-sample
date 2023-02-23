import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_sample/models/user_model.dart';
import 'package:mvvm_sample/services/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.service}) : super(UserInitial());

  late UserSerivce service;

  void getUser() async {
    emit(UserLoading());

    try {
      List<UserModel> users = await service.getUser();
      users = users.toSet().toList();
      emit(UserLoaded(users: users));
    } catch (e) {
      print(e);
      emit(UserFailed(error: e.toString()));
    }
  }
}
