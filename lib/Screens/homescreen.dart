//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MeterScreen extends StatelessWidget {
  MeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartMeterApp"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemBuilder: (context, index) => const Text('this is data'),
        ),
      ),
    );
  }
}
