import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/view_model/add_cubit/add_user_cubit.dart';

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
                      BlocProvider.of<AddUserCubit>(context).adduser(
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
