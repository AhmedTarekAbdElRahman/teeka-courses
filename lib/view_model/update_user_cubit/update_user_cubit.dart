import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';
import 'package:teeka_courses/model/user_model.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.firestoreService) : super(UpdateUserInitial());
  FirestoreService firestoreService;

  Future<void> updateUserCubit({

    required String id, required String name, required String company, required String age,
  }) async {
    emit(UpdateUserLoading());
    await firestoreService.editDoc(id: id,
        model: UserModel(age: age, name: name, company: company).toMap()).then((
        value) => emit(UpdateUserSuccess())).catchError((err) {
      print(err.toString());
    });
  }
}
