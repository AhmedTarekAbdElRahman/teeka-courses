import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeka_courses/api_service/api_service.dart';
import 'package:teeka_courses/view_model/add_cubit/add_user_cubit.dart';
import 'package:teeka_courses/view_model/delete_user_cubit/delete_user_cubit.dart';
import 'package:teeka_courses/view_model/get_users_cubit/get_user_cubit.dart';
import 'firebase_services/firestore_service.dart';
import 'firebase_services/storage_service.dart';
import 'view_model/update_user_cubit/update_user_cubit.dart';
import 'views/home_view.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {


  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var x = await FirebaseMessaging.instance.getToken();
  // print(x);
  await FirebaseMessaging.instance.requestPermission();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('object');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic('all');//all users

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          GetUserCubit(FirestoreService())
            ..getUser(),
        ),
        BlocProvider(
          create: (context) => DeleteUserCubit(FirestoreService()),
        ),
        BlocProvider(
          create: (context) => AddUserCubit(FirestoreService(),StorageService(),ApiService(Dio())),
        ),
        BlocProvider(
          create: (context) => UpdateUserCubit(FirestoreService(),ApiService(Dio())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}

