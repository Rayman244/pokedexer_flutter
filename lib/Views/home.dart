import 'package:flutter/material.dart';
import 'package:intro_to_widgets/views/poke_list.dart';
import 'package:intro_to_widgets/controllers/search_delegates.dart';

import '../models/all_pokemon.dart' as poke_info;
// import 'home_card.dart';

/// current home page displays a list of all pokemon with a littloe info about them like there name number and there types
///
class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  Future<List<Map<String, dynamic>>> pokeList =
      poke_info.getPokemon("https://pokeapi.co/api/v2/pokemon/");

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
        title: const Text("Pokedexer"),
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Items'),
            ),
          ],
        ),
      ),
    );
  }
}
