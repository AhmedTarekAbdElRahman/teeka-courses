part of 'add_user_cubit.dart';

@immutable
abstract class AddUserState {}

class AddUserInitial extends AddUserState {}
class AddImageSuccess extends AddUserState {}
class AddImageFailure extends AddUserState {}
class AddImageLoading extends AddUserState {}
class AddUserSuccess extends AddUserState {}
class AddUserFailure extends AddUserState {}
class AddUserLoading extends AddUserState {}
class AddImagePickedSuccess extends AddUserState {}
class AddImagePickedFailure extends AddUserState {}
