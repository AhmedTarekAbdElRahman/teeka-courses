part of 'get_user_cubit.dart';

@immutable
abstract class GetUserState {}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState{}
class GetUserSuccess extends GetUserState{
  final List<UserModel>userModel;
  GetUserSuccess(this.userModel);
}
class GetUserFailure extends GetUserState{
  final String errMessage;
  GetUserFailure(this.errMessage);
}