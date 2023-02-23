part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded({required this.users});
}

class UserFailed extends UserState {
  final String error;

  UserFailed({required this.error});
}
