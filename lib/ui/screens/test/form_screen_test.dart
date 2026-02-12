import 'package:flutter/material.dart';
import 'package:blabla/ui/screens/ride_pref/widgets/ride_prefs_form.dart';

class FormScreenTest extends StatelessWidget {
  const FormScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Form'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RidePrefForm(),
      ),
    );
  }
}