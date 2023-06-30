import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/update_user_cubit/update_user_cubit.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key,
    required this.name,
    required this.company,
    required this.age, required this.id});

  final String id;
  final String name;
  final String company;
  final String age;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController companyController =
    TextEditingController(text: company);
    TextEditingController ageController = TextEditingController(text: age);

    return Scaffold(
      appBar: AppBar(title: Text('Update'), backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
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
                      BlocProvider.of<UpdateUserCubit>(context).updateUserCubit(
                          id:id,
                          name: nameController.text,
                          company: companyController.text,
                          age: ageController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
