import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:chatly/screens/registration_screen.dart';
import 'package:chatly/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login_screen";

  LoginScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  Future<void> _handleLogin(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      } catch (e) {
        showOkAlertDialog(
          context: context,
          title: 'Sign in failed',
          message: 'Please try again',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: kPurpleColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      const Text(
                        'Chatly',
                        style: TextStyle(fontFamily: 'VT323', fontSize: 64),
                      ),
                      const Text(
                        'Real-time chat',
                        style: TextStyle(fontFamily: 'VT323', fontSize: 32),
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          cursorColor: kDarkGrey,
                          validator: (value) =>
                              value != null && isEmail(value.trim())
                                  ? null
                                  : 'Invalid input',
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: kDarkGrey,
                          obscureText: true,
                          validator: (value) =>
                              value != null && value.length >= 6
                                  ? null
                                  : 'Field must have atleast 6 characters',
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        height: 50,
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 500.0),
                        child: ElevatedButton(
                          onPressed: () => _handleLogin(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              kDarkGrey,
                            ),
                          ),
                          child: const Text('Log in'),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, RegistrationScreen.id),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(kDarkGrey),
                        ),
                        child: const Text("Don't have an account? Sign up"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
