import 'package:carpoolfront/places_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyCO_QpoX9zLLUTi7HbsB7VAuG9JoTpz-Nw';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    print(jsonResults);
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
