import 'package:flutter/material.dart';
import '/ui/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String label;  
  final VoidCallback? onPressed; // declare for the action in future 
  final bool isPrimary;    // declare for validate primary and secondary button
  final IconData? icon;     // icon can be null on this base on requirement
  final bool isExpanded;  // use this for take full width or default
 
  const BlaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,  // put this true because it should to check in the widget created button
    this.icon,
    this.isExpanded = false, // button not always need full size 
  });
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget content = icon != null //  created this widget for reusable in button widget 
    ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
       Icon(icon, size:20),
       const SizedBox(width :BlaSpacings.s),
       Text(label), 
      ],
    )
    : Text(label);

    Widget button = isPrimary   // primary button 
    ? ElevatedButton(onPressed: onPressed, 
    style: ElevatedButton.styleFrom(
      backgroundColor: BlaColors.primary,
      foregroundColor: BlaColors.white,
     padding: EdgeInsets.symmetric(
      horizontal: BlaSpacings.l,
      vertical: BlaSpacings.m, 
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    )
    ),
    child: content
    )
    : OutlinedButton(onPressed: onPressed,  // secondary button 
    style: OutlinedButton.styleFrom(
    foregroundColor: BlaColors.primary,
    side: BorderSide(color: BlaColors.greyLight),
    padding: EdgeInsets.symmetric(
      horizontal: BlaSpacings.l,
      vertical: BlaSpacings.m, 
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    )
    ),
    child: content
    );
    return isExpanded ?  // where the button have full size or default 
    SizedBox(width: double.infinity,child: button,) : button; 
  }
}