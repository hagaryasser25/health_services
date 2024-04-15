import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_services/admin/add_service.dart';
import 'package:health_services/admin/admin_count.dart';
import 'package:health_services/admin/admin_home.dart';
import 'package:health_services/admin/admin_list.dart';
import 'package:health_services/admin/admin_services.dart';
import 'package:health_services/auth/admin_login.dart';
import 'package:health_services/auth/login_screen.dart';
import 'package:health_services/auth/signup.dart';
import 'package:health_services/user/user_doctors.dart';
import 'package:health_services/user/user_home.dart';
import 'package:health_services/user/user_speciality.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : FirebaseAuth.instance.currentUser!.email == "admin@gmail.com"
              ? const AdminHome()
              : UserHome(),
      routes: {
        SignUp.routeName: (ctx) => SignUp(),
        AdminHome.routeName: (ctx) => AdminHome(),
        AdminLogin.routeName: (ctx) => AdminLogin(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        AdminServices.routeName: (ctx) => AdminServices(),
        AdminCount.routeName: (ctx) => AdminCount(),
        AddService.routeName: (ctx) => AddService(),
        UserHome.routeName: (ctx) => UserHome(),
        UserDoctors.routeName: (ctx) => UserDoctors(),
        UserSpeciality.routeName: (ctx) => UserSpeciality(),
        AdminList.routeName: (ctx) => AdminList(),
      },
    );
  }
}
