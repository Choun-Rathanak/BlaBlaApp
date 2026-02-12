import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';


class LocationPicker extends StatefulWidget{
 final Location? location;

 const LocationPicker({super.key, this.location});
 @override
  State<LocationPicker> createState() => _LocationPickerState();
  }

  class _LocationPickerState extends State<LocationPicker>{
      String searchQuery = "";
      final TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();

    // use to show initial value when user want to pick it again and when remove text it show all location 
    if (widget.location != null) { 
      setState(() {
      searchQuery = widget.location!.name;
      searchController.text = widget.location!.name;
      });
    
    }
  }
  
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // back screen 
  void onBack(){
    Navigator.pop<Location>(context);
  }

    // clear search input 
   void onclearSearch(){
      searchController.clear();
  }
  // trigger the search to use in the filter 
  void onSearchChanged(String search){
    setState(() {
      searchQuery = search;
    });
  }

  // i used getter list to filter by name of location 
  List<Location> get filteredLocation {
  if (searchQuery.isEmpty) {
    return fakeLocations; // Return all fake location when search is empty
  } else {
    return fakeLocations.where((location) {
    return location.name.toLowerCase().startsWith(searchQuery.toLowerCase());
  }).toList(); 
  }
}
 
  // check search not empty for put in cross button 
  bool get isSearchnotEmpty {
    return searchController.text.isNotEmpty;
  }
 // created this just for user selected tap in the locationPicker tile the value when selected to form 
   void onTap(Location selectedLocation) {
    Navigator.pop<Location>(context, selectedLocation);
  }  

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(BlaSpacings.m),
      child: Column(
        children: [
        Row(
          children: [
            IconButton(onPressed:onBack,
             icon:Icon(Icons.arrow_back_ios,
             color: BlaColors.neutralLight,  
             size: 24,
             ),
            ),
            Expanded(
             child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,   
              decoration: InputDecoration(
             hintText: 'Search City, Location',
             hintStyle: TextStyle(color: BlaColors.neutral),
             filled: true,
             fillColor: BlaColors.greyLight,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
              ),
             ),
            ),
           ),
          isSearchnotEmpty ? IconButton(
          onPressed: onclearSearch, 
          icon: Icon(Icons.close, color: BlaColors.iconLight, size: 18)
          ) : SizedBox.shrink(), // hide icon when text empty
          ],
        ),
        SizedBox(height: BlaSpacings.l),

        Expanded(child: ListView.builder(  // list tile of location
          itemCount: filteredLocation.length,
          itemBuilder: (context, index) => LocationPickerTile(location: filteredLocation[index], onTap: onTap)
          )) 
        ],
      ),
    ),

   );
  }
  }
  
  
class LocationPickerTile extends  StatelessWidget{
  final Location location;
  final void Function(Location) onTap;  // declare this for when user tap the tile is return location value here 
  const LocationPickerTile({super.key, required this.location, required this.onTap});

@override
  Widget build(BuildContext context) { 
    return Column(
      children: [
        ListTile(
          onTap:() => onTap(location),
          leading: Icon(Icons.history, color: BlaColors.iconLight ),
          title: Text(
            location.name,
            style: BlaTextStyles.body,
            
          ),
          
          trailing: Icon(
            Icons.arrow_back_ios,
            color: BlaColors.iconLight,
            size: BlaSpacings.s
          ),
          subtitle: Text(location.country.name, style: BlaTextStyles.label),
        ),
      ],
    );
  }
}