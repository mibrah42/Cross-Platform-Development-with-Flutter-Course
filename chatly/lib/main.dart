import 'package:chatly/screens/login_screen.dart';
import 'package:chatly/screens/registration_screen.dart';
import 'package:chatly/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Chatly());
}

class Chatly extends StatelessWidget {
  const Chatly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: kPurpleColor,
              body: Center(
                child: CircularProgressIndicator(
                  color: kDarkGrey,
                ),
              ),
            );
          } else {
            if (snapshot.hasData && snapshot.data!.emailVerified) {
              // Go to chat screen
              return ChatScreen(
                user: snapshot.data!,
              );
            }

            if (snapshot.hasError) {
              // Display error message
              return const Scaffold(
                backgroundColor: kPurpleColor,
                body: Center(
                  child: Text(
                    'An error ocurred,',
                    style: TextStyle(
                      color: kDarkGrey,
                    ),
                  ),
                ),
              );
            }

            return LoginScreen();
          }
        },
      ),
    );
  }
}
