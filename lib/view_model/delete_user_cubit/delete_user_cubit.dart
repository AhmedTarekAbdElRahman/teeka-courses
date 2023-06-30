import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this.firestoreService) : super(DeleteUserInitial());
  final FirestoreService firestoreService;

  Future<void> deleteUser({required String id})async{
    emit(DeleteUserLoading());
    await firestoreService.deleteDoc(id: id).then((value) => emit(DeleteUserSuccess())).catchError((error){
      debugPrint(error.toString());
    });
  }
}
