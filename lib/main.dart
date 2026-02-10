
import 'package:flutter/material.dart';
import 'ui/screens/ride_pref/ride_prefs_screen.dart';
import 'ui/screens/test/blabutton_test.dart';
import 'ui/theme/theme.dart';

void main() {
   runApp(const BlaBlaApp()); 
}


class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home:  const BlaButtonTestScreen(),
    );
  }
}
