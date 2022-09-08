
import 'package:flutter/material.dart';
import 'package:intro_to_widgets/Views/search_pokemon.dart';
import 'package:intro_to_widgets/models/all_pokemon.dart';
import 'package:intro_to_widgets/models/poke_lists.dart';

/// MySearchDelegate
///
/// handles all the search functionality whne searching for a pokemon
class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = pokemonNames;

  late Future<Map<String,dynamic>> pokemon;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (() {
          if (query.isEmpty) {
            close(context, null);
          }
          query = '';
        }),
      ),
    ];
  }

  /// builds an widget on the peading part of the search bar. in this case its just a back button
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (() {
        Navigator.pop(context);
      }),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   pokemon = findByName(query);
    // print(findByName(query));

    return FutureBuilder(
      future: pokemon,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = SearchResults(snapshot: snapshot);
        } else if (snapshot.hasError) {
          child = const Text("Error Connecting To Database");
          debugPrint("Error populating list");
        } else {
          child = const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Container(
          child: child,
        );
      },
    );

    // return Center(
    //   child: Text(query),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            pokemon = findByName(query);
            showResults(context);
          },
        );
      },
    );
  }
}