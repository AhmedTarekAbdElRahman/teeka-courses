part of 'add_user_cubit.dart';

@immutable
abstract class AddUserState {}

class AddUserInitial extends AddUserState {}
class AddUserSuccess extends AddUserState {}
class AddUserFailure extends AddUserState {}
class AddUserLoading extends AddUserState {}
