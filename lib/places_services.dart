import 'dart:convert';

import 'package:carpoolfront/places_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}

class PlacesService {
  final key = 'AIzaSyCO_QpoX9zLLUTi7HbsB7VAuG9JoTpz-Nw';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    // var input = 'your_search_input';
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&components=country:PK&key=$key';

    // var url =
    //     'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&location=24.8607%67.0011&types=geocode&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    print(jsonResults);
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<LatLng> fetchLatLng(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/geocode/json?place_id=$placeId&key=$key';
    final response = await http.get(Uri.parse(url));

    final data = json.decode(response.body);
    final results = data['results'] as List<dynamic>;

    final location = results[0]['geometry']['location'];
    final lat = location['lat'];
    final lng = location['lng'];
    return LatLng(lat, lng);
  }
}
