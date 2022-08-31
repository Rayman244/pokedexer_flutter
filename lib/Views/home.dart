import 'package:flutter/material.dart';
import 'package:intro_to_widgets/Views/poke_list.dart';
import 'package:intro_to_widgets/Views/search_pokemon.dart';
import 'package:intro_to_widgets/models/all_pokemon.dart';
import 'package:intro_to_widgets/models/poke_names_list.dart';
import '../models/all_pokemon.dart' as poke_info;
import 'home_card.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  Future<List<Map<String, dynamic>>> pokeList =
      poke_info.getPokemon("https://pokeapi.co/api/v2/pokemon/");
  int page = 1;
  int limit = 0;

  // @override
  // initState() {
  //   pokeList ;
  //   // getByUrl("https://pokeapi.co/api/v2/pokemon/");
  //   // print("state initialized");
  // }

  @override
  Widget build(BuildContext context) {
    refresh(next) {
      setState(() {
        pokeList = poke_info.getPokemon(next);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pokedex"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: pokeList,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = allPokemon(snapshot, context, refresh);
          } else if (snapshot.hasError) {
            child = const Text("Error Connecting To Database");
            print("Error populating list");
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
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  var searchResults =pokemonNames;

  var pokemon;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    // throw UnimplementedError();
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

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // throw UnimplementedError();
    // return IconButton(
    //   icon: const Icon(Icons.arrow_back),
    //   onPressed: (() {}),
    // );
  }

  @override
  Widget buildResults(BuildContext context) {
    //  return Text("hello");
    // TODO: implement buildResults
    print(query);

    findByName(query);

    return FutureBuilder(
      future: pokemon,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = SearchResults(snapshot: snapshot);
        } else if (snapshot.hasError) {
          child = const Text("Error Connecting To Database");
          print("Error populating list");
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
