import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenstate();
  }
}

class _AuthScreenstate extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var emailid = '';
  var password1 = '';
  bool haserror = false;

  void submit() {
    _form.currentState?.save();
    // print(emailid);
    // print(password1);

    try {
      _firebase.signInWithEmailAndPassword(email: emailid, password: password1);
    } on FirebaseAuthException catch (e) {
      setState(() {
        haserror = true;
      });
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided';
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              width: 150,
              child: Image.asset('assets/logo1.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8.0),
                        TextFormField(
                          //controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'EmailId',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: haserror
                                        ? Colors.red
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground)),
                          ),
                          onSaved: (value) {
                            emailid = value!;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8.0),
                        TextFormField(
                            // controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: haserror
                                          ? Colors.red
                                          : Theme.of(context)
                                              .colorScheme
                                              .onBackground)),
                            ),
                            onSaved: (value) {
                              password1 = value!;
                            }),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            submit();
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(220, 60))),
                          child: const Text('Login'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
