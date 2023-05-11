import 'package:carpoolfront/places_search.dart';
import 'package:carpoolfront/places_services.dart';
import 'package:flutter/foundation.dart';

class ListPlaces extends ChangeNotifier {
  final placesService = PlacesService();

  List<PlaceSearch> searchResults = [];

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
