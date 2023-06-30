import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/view_model/delete_user_cubit/delete_user_cubit.dart';
import 'package:teeka_courses/view_model/get_users_cubit/get_user_cubit.dart';
import 'package:teeka_courses/views/add_view.dart';
import 'package:teeka_courses/views/update_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Home'),
      ),
      body: BlocBuilder<GetUserCubit, GetUserState>(
        builder: (context, state) {
          if (state is GetUserFailure) {
            return Text(state.errMessage);
          } else if (state is GetUserSuccess) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.userModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                   // leading: Image.network(
                     //   'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
                    title: Text(state.userModel[index].name!),
                    subtitle: Text(
                        'work at ${state.userModel[index].company!} and i have ${state.userModel[index].age!} years'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateView(
                                      company: state.userModel[index].company!,
                                      name: state.userModel[index].name!,
                                      age: state.userModel[index].age!,
                                      id: state.userModel[index].uId!,
                                    ),
                                  ));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<DeleteUserCubit>(context)
                                  .deleteUser(id: state.userModel[index].uId!);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddView(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
