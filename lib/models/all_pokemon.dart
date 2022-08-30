import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getPokemon() async {
  List<Map<String, dynamic>> fullList = [];
  var uri = Uri.parse("https://pokeapi.co/api/v2/pokemon/");
  var request = await http.get(uri);
  var response = json.decode(request.body);
  for (var pokemon in response['results']) {
    var uri2 = Uri.parse(pokemon['url']);
    var req2 = await http.get(uri2);
    var response2 = json.decode(req2.body);
    fullList.add(response2);
  }

  return fullList;
}

Future<Map<String, dynamic>> getIndividualData(pokeId) async {
  var uri = Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokeId");
  var request = await http.get(uri);
  var response = json.decode(request.body);
  return response;
}

getNextPage(int pageNo) {
  String baseUrl = "https://pokeapi.co/api/v2/pokemon/";

  if (pageNo == 1) {
    print(baseUrl);
  } else {
    int offset = pageNo + 20;
    print("$baseUrl/?offset=$offset&limit=20");
  }
}
