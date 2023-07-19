import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/api_service/api_service.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';
import 'package:teeka_courses/model/user_model.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.firestoreService,this.apiService) : super(UpdateUserInitial());
  FirestoreService firestoreService;
  ApiService apiService;

  Future<void> updateUserCubit({
    required String id,
    required String name,
    required String company,
    required String age,
  }) async {
    emit(UpdateUserLoading());
    await firestoreService
        .editDoc(
            id: id,
            model: UserModel(age: age, name: name, company: company).toMap())
        .then((value) async {
      await apiService.postData(data: {
        'to': '/topics/all',
        'notification': {
          "title": 'test',
          "body": "test",
          "sound": "default"
        },
        // 'data': 'test',
      });
      emit(UpdateUserSuccess());
    }).catchError((err) {
      print(err.toString());
    });
  }
}
