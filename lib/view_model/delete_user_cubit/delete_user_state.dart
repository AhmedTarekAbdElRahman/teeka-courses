part of 'delete_user_cubit.dart';

@immutable
abstract class DeleteUserState {}

class DeleteUserInitial extends DeleteUserState {}
class DeleteUserSuccess extends DeleteUserState {}
class DeleteUserFailure extends DeleteUserState {}
class DeleteUserLoading extends DeleteUserState {}