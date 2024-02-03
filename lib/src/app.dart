import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:deborduurshop/auth/login.dart';
import 'package:deborduurshop/firebase_options.dart';
import 'package:deborduurshop/provider/database_provider.dart';
import 'package:deborduurshop/provider/story_provider.dart';
import 'package:deborduurshop/src/components/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// User? user;

class MyApp extends StatelessWidget {
  const MyApp._({Key? key}) : super(key: key);
  static Future<void> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // FirebaseAuth auth = FirebaseAuth.instance;
    // user = auth.currentUser;
    runApp(const MyApp._());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => StoryProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => DatabaseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BoPeDo',
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: AnimatedSplashScreen(
          splash: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/applogo.png'),
                  height: 150,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          // nextScreen: HomePage(),
          nextScreen: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return HomePage(); // User is already logged in
                  return HomePage(); // User is already logged in
                } else {
                  return const LoginScreen(); // User is not logged in
                }
              }),
          splashIconSize: 250,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          animationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
