import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:chatly/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:validators/validators.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = "registration_screen";

  RegistrationScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  Future<void> _handleSignup(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        final credential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        if (credential.user != null) {
          await credential.user!.updateDisplayName(
            _nameController.text.trim(),
          );
          await credential.user!.sendEmailVerification();
          await showOkAlertDialog(
            context: context,
            title: 'Email Sent',
            message: 'Please verify your email',
          );
          await _auth.signOut();
          Navigator.pop(context);
        }
      } catch (e) {
        showOkAlertDialog(
          context: context,
          title: 'An Error Occurred',
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
                        'Sign up',
                        style: TextStyle(fontFamily: 'VT323', fontSize: 64),
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          cursorColor: kDarkGrey,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) => value != null &&
                                  value.trim().length >= 2 &&
                                  isAlpha(value.trim())
                              ? null
                              : 'Invalid input',
                          decoration: InputDecoration(
                            hintText: 'Name',
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
                          onPressed: () => _handleSignup(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              kDarkGrey,
                            ),
                          ),
                          child: const Text('Sign up'),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(kDarkGrey),
                        ),
                        child: const Text("Back to log in"),
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
