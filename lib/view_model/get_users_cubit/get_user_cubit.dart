import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';
import 'package:teeka_courses/model/user_model.dart';
part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.firestoreService) : super(GetUserInitial());
  final FirestoreService firestoreService;
  List<UserModel> userModelList=[];
  // Future<void> getUser() async {
  //   emit(GetUserLoading());
  //   await firestoreService.getCollection().then((value){
  //     userModelList=[];
  //     for(var doc in value.docs){
  //       userModelList.add(UserModel.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>> ));
  //     }
  //     emit(GetUserSuccess(userModelList));
  //   }).catchError((error){
  //      debugPrint(error.toString());
  //   });
  // }
  Future<void> getUser() async {
    emit(GetUserLoading());
     firestoreService.getCollectionSnapshot().listen((value){
      userModelList=[];
      for(var doc in value.docs){
        userModelList.add(UserModel.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>> ));
      }
      emit(GetUserSuccess(userModelList));
    }).onError((error){
      debugPrint(error.toString());
    });
  }
}
