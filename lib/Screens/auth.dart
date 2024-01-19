import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthScreenstate();
  }
}

class _AuthScreenstate extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 15,
              shadowColor: Color.fromARGB(255, 25, 148, 225),
              borderOnForeground: true,
              color: Theme.of(context).colorScheme.onPrimary,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'UserName',
                            suffixIcon: Icon(Icons.email)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'password',
                            suffixIcon: Icon(Icons.shop_two)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
