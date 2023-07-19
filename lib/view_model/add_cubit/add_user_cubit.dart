import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teeka_courses/firebase_services/firestore_service.dart';
import 'package:teeka_courses/firebase_services/storage_service.dart';
import 'package:teeka_courses/model/user_model.dart';
import 'package:teeka_courses/api_service/api_service.dart';
part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {

  AddUserCubit(this.firestoreService, this.storageService,this.apiService)
      : super(AddUserInitial());
  FirestoreService firestoreService;
  ApiService apiService;

  StorageService storageService;
  var picker = ImagePicker();
  File? pickedImage;

  Future<void> getProfileImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      emit(AddImagePickedSuccess());
    } else {
      emit(AddImagePickedFailure());
    }
  }

  Future<void> uploadImage({
    required String name,
    required String company,
    required String age,
  }) async {
    emit(AddImageLoading());
    if (pickedImage != null) {
      await storageService.uploadImage(image: pickedImage!).then((value) async {
        emit(AddImageSuccess());
        await value.ref.getDownloadURL().then((value) {
          //value is the urlImage
          adduser(image: value, name: name, company: company, age: age);
        });
      }).catchError((err) {
        print(err.toString());
      });
    } else {
      adduser(
          image:
              'https://invisiblechildren.com/wp-content/uploads/2012/07/facebook-profile-picture-no-pic-avatar.jpg',
          name: name,
          company: company,
          age: age);
    }
  }

  Future<void> adduser({
    required String name,
    required String company,
    required String age,
    required String image,
  }) async {
    emit(AddUserLoading());
    await firestoreService
        .addDoc(
            model:
                UserModel(name: name, age: age, company: company, image: image)
                    .toMap())
        .then((value)async {
      await apiService.postData(data: {
        'to': '/topics/all',
        'notification': {
          "title": 'test',
          "body": "test",
          "sound": "default"
        },
        'data': 'test',
      });
      emit(AddUserSuccess());
    }).catchError((err) {
      print(err.toString());
    });
  }
}
