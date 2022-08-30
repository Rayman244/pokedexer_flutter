import 'package:flutter/material.dart';
import 'package:intro_to_widgets/models/all_pokemon.dart';
import '../models/all_pokemon.dart' as poke_info;
import 'home_card.dart';

class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  final Future<List<Map<String, dynamic>>> pokeList = poke_info.getPokemon();
  int page = 1;
  int _limit = 20;

  refresh() {
    setState(() {
      page += 1;
      getNextPage(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: pokeList,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = homeCard(snapshot, context);
        } else if (snapshot.hasError) {
          children = [];
          print("Error populating list");
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          ];
        }
        return 
         ListView(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          children: children,
        );
      },
    );
  }
}
