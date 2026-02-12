import 'package:blabla/data/dummy_data.dart';
import '../../../widgets/actions/bla_button.dart';
import '../../../widgets/display/bla_divider.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import '/utils/date_time_utils.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';


///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  void tempLocation() {
    // use this method to swap the location in switch button
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  bool get isFormValid {
    // logic for valiadate form make sure it can create when departure and arrival value is not null
    if (departure != null && arrival != null) {
      return true;
    }
    return false;
  }
  @override
  void initState() {
    super.initState();
    // TODO
    if(!isFormValid || departureDate == null || requestedSeats < 1 ){
    departure = widget.initRidePref?.departure; // use initail value from departure if provide or it turn to null
    arrival = widget.initRidePref?.arrival; //use initial value is null beginning
    departureDate =widget.initRidePref?.departureDate ??DateTime.now(); // it can be default value or today date
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1; // it can be 1 from start then value of requestseats
    }
    
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  void onSearch() {
    // i use for valiadiate button when search but it just show on dialog
    if (!isFormValid || departureDate == null || requestedSeats < 1) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please make sure input departure and arrival, date of departure and seat properly',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                // here is GestureDetector draft for the departure location
                onTap: () async {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: BlaSpacings.l,
                    horizontal: BlaSpacings.m,
                  ),
                  
                  child: Row(
                    spacing: BlaSpacings.m,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: BlaColors.neutral,
                        size: BlaSpacings.l,
                      ),

                      Text(
                        departure?.name ?? 'Leaving from',
                        style: departure == null
                            ? TextStyle(color: BlaColors.neutralLight)
                            : BlaTextStyles.body,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            

            const SizedBox(width: BlaSpacings.m),
            IconButton(
              // here is the switch icon
              onPressed: tempLocation,
              icon: Icon(Icons.swap_vert, color: BlaColors.primary),
            ),
          ],
        ),
        
        BlaDivider(),

        const SizedBox(height: BlaSpacings.l),
        GestureDetector(
          // here is GestureDetector draft for the arrival location
          onTap: () async {
            print("Test");
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: BlaSpacings.l,
              horizontal: BlaSpacings.m,
            ),
            
            child: Row(
              spacing: BlaSpacings.m,
              children: [
                Icon(
                  Icons.location_on,
                  color: BlaColors.neutral,
                  size: BlaSpacings.l,
                ),

                Text(
                arrival?.name ?? 'Going to',
                style: arrival == null
                      ? TextStyle(color: BlaColors.neutralLight)
                      : BlaTextStyles.body,
                ),
              ],
            ),
          ),
        ),
      
        BlaDivider(),
        const SizedBox(height: BlaSpacings.l),

           Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month,
                  color: BlaColors.neutral,
                  size: BlaSpacings.l,
                ),
              ),
              const SizedBox(width: BlaSpacings.m),
              Text(
                DateTimeUtils.formatDateTime(departureDate),
                style: BlaTextStyles.body,
              ),
            ],
          ),
        const SizedBox(height: BlaSpacings.l),
        BlaDivider(),
        const SizedBox(height: BlaSpacings.m),

        GestureDetector(
          // here is GestureDetector draft for the reqestionseat
          onTap: () async {
            print("Test");
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: BlaSpacings.l,
              horizontal: BlaSpacings.m,
            ),
            child: Row(
              spacing: BlaSpacings.m,
              children: [
                Icon(
                  Icons.person,
                  color: BlaColors.neutral,
                  size: BlaSpacings.l,
                ),
                Text('1', style: TextStyle(color: BlaColors.neutralLight)),
              ],
            ),
          ),
        ),

        BlaButton(
          label: "Search",
          onPressed: onSearch,
          isPrimary: true,
        ),
      ],
    );
  }
}
