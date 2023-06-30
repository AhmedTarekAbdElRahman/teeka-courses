import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';
import 'package:teeka_courses/model/user_model.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.firestoreService) : super(AddUserInitial());
  FirestoreService firestoreService;

  Future<void> adduser({
    required String name,
    required String company,
    required String age,
  }) async {
    emit(AddUserLoading());
    await firestoreService
        .addDoc(
            model: UserModel(name: name, age: age, company: company).toMap())
        .then((value) => emit(AddUserSuccess()))
        .catchError((err) {
      print(err.toString());
    });
  }
}
