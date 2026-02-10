import '../data/dummy_data.dart';
import '../model/ride/ride.dart';
import '../model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides, Location departure) {
    return rides.where((ride) => ride.departureLocation == departure).toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(
    List<Ride> rides,
    int requestedSeat,
  ) {
    return rides.where((ride) => ride.availableSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> result = availableRides;

    if (departure != null) {
      result = _filterByDeparture(result, departure);
    }

    if (seatRequested != null) {
      result = _filterBySeatRequested(result, seatRequested);
    }

    return result;
  }
}
