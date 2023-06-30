part of 'update_user_cubit.dart';

@immutable
abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}
class UpdateUserLoading extends UpdateUserState {}
class UpdateUserSuccess extends UpdateUserState {}
class UpdateUserFailure extends UpdateUserState {}
