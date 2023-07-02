import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teeka_courses/view_model/add_cubit/add_user_cubit.dart';

import '../custom_alert.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add'),backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                BlocBuilder<AddUserCubit,AddUserState>(
                  builder: (context, state) {
                    var pickedImage =
                        BlocProvider.of<AddUserCubit>(context).pickedImage;
                    return Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 9.8,
                            backgroundColor: Colors.transparent,
                            child: pickedImage == null
                                ? ClipOval(
                              child: Image.network('https://invisiblechildren.com/wp-content/uploads/2012/07/facebook-profile-picture-no-pic-avatar.jpg')
                            )
                                : ClipOval(
                              child: Image(
                                image: FileImage(pickedImage),
                                height: double.infinity,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              customAlert(
                                  context: context,
                                  getGallery: () {
                                    Navigator.of(context).pop();
                                    BlocProvider.of<AddUserCubit>(context)
                                        .getProfileImage(ImageSource.gallery);
                                  },
                                  getCamera: () {
                                    Navigator.of(context).pop();
                                    BlocProvider.of<AddUserCubit>(context)
                                        .getProfileImage(ImageSource.camera);
                                  });
                            },
                            icon: const CircleAvatar(
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                TextFormField(
                  controller: nameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter data';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: companyController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter data';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please,enter data';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      BlocProvider.of<AddUserCubit>(context).uploadImage(
                          name: nameController.text,
                          company: companyController.text,
                          age: ageController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
