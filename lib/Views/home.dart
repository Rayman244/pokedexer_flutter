import 'package:flutter/material.dart';
import '../models/Pokemon_Info.dart' as poke_info;
import './homeCard.dart';



class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State<HomeGrid> createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  final Future<List<Map<String, dynamic>>> pokeList = poke_info.getPokemon();
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Pokedex")),
        body: FutureBuilder<List<Map<String, dynamic>>>(
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
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                children: children,
              );
            }),
      ),
    );
  }
}