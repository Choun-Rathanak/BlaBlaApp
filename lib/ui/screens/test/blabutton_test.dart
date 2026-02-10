import 'package:flutter/material.dart';
import '../ride_pref/widgets/bla_button.dart';
import '/ui/theme/theme.dart';

class BlaButtonTestScreen extends StatelessWidget {
  const BlaButtonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Test'),
        backgroundColor: BlaColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            //test primary button
            BlaButton(
              label: 'Primary Button',
              onPressed: () => print('Primary pressed'),
            ),
            const SizedBox(height: BlaSpacings.m),
            
            // test secondary button
            BlaButton(
              label: 'Secondary Button',
              isPrimary: false,
              onPressed: () => print('Secondary pressed'),
            ),
            
            const SizedBox(height: BlaSpacings.m),
            // test the button with icon
            BlaButton(
              label: 'Search',
              icon: Icons.search,
              onPressed: () => print('Search pressed'),
            ),
            
            const SizedBox(height: BlaSpacings.m),
            
            // test when the button is disabled 
            BlaButton(
              label: 'Disabled',
              onPressed: null, 
            ),
            
            const SizedBox(height: BlaSpacings.m),
            
            // test the Expanded of button is full width
            BlaButton(
              label: 'Full Width Button',
              isExpanded: true, 
              onPressed: () => print('Full width pressed'),
            ),
            
            const SizedBox(height: BlaSpacings.m),
            
            // test secondry with icon with full width
            BlaButton(
              label: 'Cancel',
              icon: Icons.close,
              isPrimary: false,
              isExpanded: true, 
              onPressed: () => print('Cancel pressed'),
            ),
          ],
        ),
      ),
    );
  }
}