import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_provider/pages/home_page.dart';
import 'package:fb_auth_provider/pages/signin_page.dart';
import 'package:fb_auth_provider/pages/signup_page.dart';
import 'package:fb_auth_provider/pages/splash_page.dart';
import 'package:fb_auth_provider/providers/auth/auth_provider.dart';
import 'package:fb_auth_provider/providers/profile/profile_provider.dart';
import 'package:fb_auth_provider/providers/signup/signup_provider.dart';
import 'package:fb_auth_provider/providers/singin/signin_provider.dart';
import 'package:fb_auth_provider/repositories/auth_repositories.dart';
import 'package:fb_auth_provider/repositories/profile_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'fb_auth_provider',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepositories>(
          create: (context) => AuthRepositories(
              firebaseFirestore: FirebaseFirestore.instance,
              firebaseAuth: fb_auth.FirebaseAuth.instance),
        ),
        Provider<ProfileRepositories>(
          create: (context) => ProfileRepositories(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        StreamProvider<fb_auth.User?>(
            create: (context) => context.read<AuthRepositories>().user,
            initialData: null),
        ChangeNotifierProxyProvider<fb_auth.User?, AuthProvider>(
            create: (context) => AuthProvider(
                authRepositories: context.read<AuthRepositories>()),
            update: (BuildContext context, fb_auth.User? user,
                    AuthProvider? authProvider) =>
                authProvider!..udpate(user)),
        ChangeNotifierProvider<SigninProvider>(
          create: (context) => SigninProvider(
            authRepositories: context.read<AuthRepositories>(),
          ),
        ),
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(
            authRepositories: context.read<AuthRepositories>(),
          ),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(
            profileRepositories: context.read<ProfileRepositories>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Auth Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: SplashPage(),
        routes: {
          SignupPage.routeName: (context) => SignupPage(),
          SigninPage.routeName: (context) => SigninPage(),
          HomePage.routeName: (context) => HomePage()
        },
      ),
    );
  }
}
